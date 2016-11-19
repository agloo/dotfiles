#!/bin/sh
wd="$(dirname $0)"
# Variables for my window resizing hotkeys.
export WIDTH=$(xrandr | grep \* | cut -c 4-11 | cut -d x -f 1)
export HEIGHT=$(xrandr | grep \* | cut -c 4-11 | cut -d x -f 2)
# Listen for X events using a tool taken from an older version of wmutils.
$wd/goodwew | $wd/core/Xhandler.sh &
# Initialize workspaces.
$wd/core/workspace.sh -i &
# Start the window modification script:
$wd/looks/pulse/pulse.sh &
# Start lemonbar.
$wd/looks/lemon.sh
