#!/bin/sh

# Define an array containing file extensions to search for
FILE_EXTENSIONS=('sh' 'js' 'ts')

# Initialize an empty array to store the found files
found_files=()

# Loop through each file extension
for extension in "${FILE_EXTENSIONS[@]}"; do
    # Use 'find' command to search for files with the current extension
    # and append found files to the 'found_files' array
    found_files+=( $(find . -type f -name "*.$extension") )
done

# Get the number of files found
num_files_found=${#found_files[@]}

# Initialize a variable to store the selected file path
selected_file=""

# Check the number of files found
if [ "$num_files_found" -gt 1 ]; then

    # If more than one file is found, prompt the user to select one using 'fzf'
    selected_file=$(for file in "${found_files[@]}"; do
        echo "$file"
    done | fzf)

elif [ "$num_files_found" -eq 1 ]; then

    # If only one file is found, assign that file to 'selected_file'
    selected_file="${found_files}"

fi

# Check if a file has been selected
if [ -n "$selected_file" ]; then
    # If a file is selected, run the selected file path
    file_extension=$(echo $selected_file | awk -F . '{print $NF}' )

    case $file_extension in
        sh) sh $selected_file ;;
        js) node $selected_file ;;
        ts) ts-node $selected_file ;;
    esac

else
    # If no file is found, print a message indicating that no files were found
    echo "No files were found"
fi

