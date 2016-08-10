#!/bin/bash
wd=$(dirname $0)
while getopts ":t" opt; do
    case $opt in
        t)
            shift $((OPTIND-1))
            chwso -r $1
            ;;
    esac
done
currwin="$(pfw)"
wtf "$1"
# TODO this is ugly. Find a good place to put the script.
$wd/../looks/chwbs/chwbs -s 3 -c 0x555753 $currwin
$wd/../looks/chwbs/chwbs -s 3 -c 0xcccccc "$1"
