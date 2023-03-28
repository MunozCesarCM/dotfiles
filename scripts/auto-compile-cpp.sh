#!/bin/bash

trap "rm output" INT TERM

files=$(ls | grep -E ".cpp$|.py$|.sh$|.java$")
amount=$(ls | grep -E ".cpp$|.py$|.sh$|.java$" | wc -l)

# if multiple results, choose one in fzf
if [ $amount -gt 1 ]; then
    files=$(ls | grep -E ".cpp$|.py$|.sh$|.java$" | fzf --layout=reverse --info=inline --margin=3 --color='bg+:#0d1017,info:7')
fi

if [ $amount -gt 0 ]; then
    extension=$(echo $files | awk -F . '{print $NF}')

    case $extension in

        cpp)
            g++ $files -o output
            ./output
            rm output
            ;;

        sh )
            ./$files ;;

        py )
            python $files ;;

        java )
            java $files ;;
    esac
fi
