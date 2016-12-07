#!/bin/bash
while getopts ":t" opt; do
    case $opt in
        t)
            shift $((OPTIND-1))
            chwso -r $1;;
    esac
done
currwin="$(pfw)"
wtf "$1"
# If you don't want to do the color cycling, turn these on.
#chwb -s 3 -c 0x555753 $currwin
#chwb -s 3 -c 0xcccccc "$1"
