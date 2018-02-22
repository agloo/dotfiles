#!/bin/sh

# Touch autorotates for some reason

# Find the line in "xrandr -q --verbose" output that contains current screen orientation and "strip" out current orientation.

rotation="$(xrandr -q --verbose | grep 'connected' | egrep -o  '\) (normal|left|inverted|right) \(' | egrep -o '(normal|left|inverted|right)')"

# Using current screen orientation proceed to rotate screen and input devices.

case "$rotation" in
    normal)
    # rotate to the left
    xrandr -o inverted
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate half
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate half
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate half
    ;;
    left)
    # rotate back to normal
    xrandr -o normal
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate none
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate none
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate none
    ;;
    inverted)
    # rotate to the right
    xrandr -o normal
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate none
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate none
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate none
    ;;
    right)
    # rotate to normal
    xrandr -o normal
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate none
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate none
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate none
    ;;
esac
