#!/bin/sh
# Set wm options here.

# Set this to 1 to make the wm change all windows' border colors in
# a gradient corresponding to the color scheme.
DYNAMIC_BORDER_COLOR=1

# Set this to 1 to use the VU meter functionality to make the window
# borders to resize with audio out level.
# Note that this requires a good deal of configuration in looks/pulse to work.
DYNAMIC_BORDER_SIZE=0

wd="$(dirname $0)"
# Variables for my window resizing hotkeys.
export WIDTH=$(xrandr | grep \* | cut -c 4-11 | cut -d x -f 1)
export HEIGHT=$(xrandr | grep \* | cut -c 4-11 | cut -d x -f 2)
# Listen for X events using a tool taken from an older version of wmutils.
$wd/core/goodwew | $wd/core/Xhandler.sh &
# Initialize workspaces.
$wd/core/workspace.sh -i &
# Start the window modification script:
if [ $DYNAMIC_BORDER_COLOR ]; then
	$wd/looks/border.sh &
fi
if [ $DYNAMIC_BORDER_COLOR ]; then
	$wd/looks/pulse/border.sh &
fi
# Start lemonbar.
$wd/looks/lemon.sh
