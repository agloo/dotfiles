#!/bin/bash
# Get the image name from standard in.
# The picture has to be a .png for some sordid reason.
new_wall="$1"
wd="$(dirname $0)"

# Make sure we're not doing nothing.
if [ ! -e $new_wall ]; then
	echo "File not found"
	exit 1
fi

# Convert jpg to png if needed.
if [ $(printf $new_wall | rev | cut -c -4 | rev) == ".jpg" ]; then
	# Use convert if you don't want to lose your filthy jpgs.
	echo "This file is a JPG. Converting it to a .png."
	mogrify -format png $new_wall
	new_wall="$(echo $new_wall | rev | cut -c 5- | rev).png"
fi

# For the terminal (urxvt and xterm only):
# TODO Make getting colors part of the installation, and source it relatively here.
# Darker images tend to make things a little hard to see.
# Feel free to increase the number of clusters/take the lighter ones.
echo "Getting colors..."
colors=$(colors -n 32 $new_wall)
colors=$(echo $colors | cut -f 9-24 -d " ")
printf "%s\n" $colors | $wd/toxrdb.sh > ~/.Xresources
printf "%s\n" $colors | $wd/toxrdb.sh | xrdb -override

## For lemonbar: Not used right now since I'm not changing backgrounds
# but it may become a thing.
#pkill lemonbar
#$wd/lemon.sh &

# For the border:
filtered_colors=$(echo $colors|sed 's/\#//g')
morph_colors=$($wd/colormorph.py 10 $filtered_colors)
#Write out the border colors we're using for the rest of the scripts to access:
echo $morph_colors | sed "s/\#//g" > $wd/sincolors
# Change the current term's color scheme while we're at it.
$wd/term_recolor.sh < ~/.Xresources
# For standard border:
#pkill border.sh
#echo "$morph_colors"|xargs $wd/border.sh &
# For something bolder:
# Clean up old pulse:
killall -9 peak_detect.py
killall -9 mass_pulse.sh
killall -9 mass_border.sh
# New pulse:
$wd/pulse/mass_pulse.sh &

# For the wallpaper:
cp $new_wall $wd/currwall
feh --bg-scale $wd/currwall
echo "Done."
