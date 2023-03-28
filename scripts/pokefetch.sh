#!/bin/sh

# Prepare ------------------------------------------------------------------------------------------

#pokemon_list=(1 4 7 10 11 14 15 25 46 54 60 63 72 92 98 102 104 116 120 138 147 152 155 158 165 167 170 173 175 177 179 183 222 228 231 239 246 252 255 258 270 271 276 278 280 283 309 311 312 315 341 406 420)
pokemon_list=(14 15 25 46 54 63 72 98 102 104 116 138 147 165 167 170 177 179 228 239 246 270 271 276 280 283 311 312 341 406 420)
pokemon=${pokemon_list[(($RANDOM % ${#pokemon_list[@]}))]}

data_pokemon=$(curl -fsLS "https://pokeapi.co/api/v2/pokemon/${pokemon}")
data_species=$(curl -fsLS "$(echo "${data_pokemon}" | jq --raw-output .species.url)")

id=$(echo "${data_species}" | jq --raw-output .id)
name=$(echo "${data_species}" | jq --raw-output '.names | .[] | select(.language.name == "en").name')
category=$(echo "${data_species}" | jq --raw-output '.genera | .[] | select(.language.name == "en").genus')
title="▐[1;7m No.$(printf '%03d' "${id}") [0m▌ [1m${name} - ${category}[0m"

for type in $(echo "${data_pokemon}" | jq --raw-output '.types | .[].type.name' | tr '[:lower:]' '[:upper:]'); do
	case "${type}" in
		NORMAL)   color=7  ;;
		FIRE)     color=9  ;;
		WATER)    color=12 ;;
		ELECTRIC) color=11 ;;
		GRASS)    color=10 ;;
		ICE)      color=14 ;;
		FIGHTING) color=1  ;;
		POISON)   color=5  ;;
		GROUND)   color=11 ;;
		FLYING)   color=6  ;;
		PSYCHIC)  color=13 ;;
		BUG)      color=2  ;;
		ROCK)     color=3  ;;
		GHOST)    color=4  ;;
		DRAGON)   color=4  ;;
		DARK)     color=3  ;;
		STEEL)    color=8  ;;
		FAIRY)    color=13 ;;
	esac

	types="${types} [7;38;5;${color}m ${type} [0m "
done

height=$(awk "BEGIN{ print $(echo "${data_pokemon}" | jq --raw-output .height) / 10 }")
weight=$(awk "BEGIN{ print $(echo "${data_pokemon}" | jq --raw-output .weight) / 10 }")
status=$(gum style --align left --width 44 "${types}" '' " Height: [1m${height}m[0m      Weight: [1m${weight}kg[0m")

info=$(gum join --vertical "${title}" '' "${status}")

entries=$(gum style --border normal --padding '0 1' --width 42 "$(echo "${data_species}" | \
jq --raw-output 'last(.flavor_text_entries | .[] | select(.language.name == "en")).flavor_text' | tr -d "\n")")

pokemon_path=$(echo "${data_pokemon}" | jq --raw-output .name)
art=$(gum style "$(curl -fsLS \
"https://gitlab.com/phoneybadger/pokemon-colorscripts/-/raw/main/colorscripts/small/regular/${pokemon_path}" \
| sed -e 's/$/[0m/g')")


# Display ------------------------------------------------------------------------------------------

terminal_size=$(stty size)
terminal_height=${terminal_size% *}
terminal_width=${terminal_size#* }

prompt_height=${PROMPT_HEIGHT:-1}

print_test() {
	no_color=$(printf '%b' "${1}" | sed -e 's/\x1B\[[0-9;]*[JKmsu]//g')

	[ "$(printf '%s' "${no_color}" | wc --lines)" -gt $(( terminal_height - prompt_height )) ] && return 1
	[ "$(printf '%s' "${no_color}" | wc --max-line-length)" -gt "${terminal_width}" ] && return 1

	gum style --align left --width="${terminal_width}" "${1}" ''
	printf '%b' "\033[A"

	exit 0
}


# Landscape layout
group_info_entries=$(gum join --vertical "${info}" '' "${entries}")
print_test "$(gum join --horizontal --align center "${art}" '  ' "${group_info_entries}")"

# Portrait layout
print_test "$(gum join --vertical --align center "${info}" '' "${art}" "${entries}")"

# Other layout
print_test "${group_info_entries}"

exit 1

