#!/bin/bash
# Get the image name from standard in.
# The picture has to be a .png for colors to work for some sordid reason.
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
  rm $new_wall
	new_wall="$(echo $new_wall | rev | cut -c 5- | rev).png"
fi

# For the terminal (urxvt and xterm only):
echo "Getting colors..."
raw_colors=$(colors -n 32 $new_wall)
colors=$(echo $raw_colors | xargs $wd/scheme.py)
printf "%s\n" $colors | $wd/toxrdb > ~/.Xresources
printf "%s\n" $colors | $wd/toxrdb | xrdb -override

# For the border:
# Remove the leading hashes
filtered_colors=$(echo $raw_colors | sed 's/\#//g')
# Blend the colors together.
gradient=$($wd/colormod.py -r 10 $filtered_colors)
# Fade them for background windows
fadient=$($wd/colormod.py -f .3 $gradient)

#Write out the border colors we're using for the rest of the scripts to access:
echo $gradient | sed "s/\#//g" > $wd/gradient
# And the faded colors:
echo $fadient| sed "s/\#//g" > $wd/faded


# Change the current term's color scheme while we're at it.
$wd/term_recolor.sh < ~/.Xresources

# Border:
# Clean up old pulse and border scripts:
killall -9 pulse.sh
killall -9 border.sh
# The python script is made to silently exit when the pipe closes.

# Start a new one:
$wd/border.sh &
# Use this if you're using the VU meter:
# $wd/pulse/pulse.sh &

# For the wallpaper:
cp $new_wall $wd/currwall
feh --bg-scale $wd/currwall
echo "Done."
