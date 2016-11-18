#!/bin/sh
wd="$(dirname $0)"
# Variables for my window resizing hotkeys.
export WIDTH=$(xrandr | grep \* | cut -c 4-11 | cut -d x -f 1)
export HEIGHT=$(xrandr | grep \* | cut -c 4-11 | cut -d x -f 2)
$wd/goodwew | $wd/core/Xhandler.sh &
$wd/core/workspace.sh -i &
$wd/looks/pulse/pulse.sh &
$wd/looks/lemon.sh
