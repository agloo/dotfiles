#!/bin/sh
# Idea and structure lovingly copied from z3bra.
# This script assumes input is given as an array of tagless hex colors
# (e.g. 123456 789abc def123)

wd=$(dirname $0)
colors="$(cat $wd/../gradient)"
faded="$(cat $wd/../faded)"
CUR=$(pfw)
i=0
if [ ${#colors} == 0 ]; then
	# These colors come along with my default .Xresources theme.
	colors="555753 665c58 77615e 886764 996c6a aa726f bb7775 cc7c7b dd8281 ee8787 ff8d8d f9968f f49f92 eea895 e9b197 e3ba9a dec39d d8cc9f d3d5a2 cddea5 c8e7a8 cde39a d3df8d d8db80 ded772 e3d365 e9d058 eecc4a f4c83d f9c430 ffc123 eab72f d6ae3c c2a549 ad9c56 999363 858970 70807d 5c778a 486e97 3465a4 476793 5a6983 6d6b72 816d62 946f51 a77141 bb7331 ce7520 e17710 f57900 e37d19 d28133 c0854c af8a66 9d8e7f 8c9299 7a97b2 699bcc 579fe5 46a4ff 58acfe 6ab5fe 7cbdfd 8ec6fd a0cefc b2d7fc c4e0fb d6e8fb e8f1fa fafafa e9e9e9 d9d9d8 c8c9c7 b8b8b7 a7a8a6 979895 868785 767774 656763"
fi

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
