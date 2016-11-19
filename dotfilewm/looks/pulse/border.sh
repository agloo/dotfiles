#!/bin/sh
# Idea and structure lovingly copied from z3bra.
# This script assumes input is given as an array of tagless hex colors
# (e.g. 123456 789abc def123)

wd=$(dirname $0)
colors="$(cat $wd/../gradient)"
faded="$(cat $wd/../faded)"
CUR=$(pfw)

col_list=($colors)
faded_list=($faded)
while read WIDTH; do
	fw=$(pfw)
	windows=$(lsw | grep -v "$fw")
	chwb -s $WIDTH -c ${col_list[$i]} $windows
	chwb -s $WIDTH -c ${faded_list[$i]} "$fw"
	i=$(expr $i + 1)
	if [ $i == ${#col_list[@]} ]; then
		i=0
	fi
done
