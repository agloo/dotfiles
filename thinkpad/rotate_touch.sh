#!/bin/sh

# Touch autorotates for some reason

# If you're trying to disable rotation on gnome, use this:
# gsettings set org.gnome.settings-daemon.plugins.orientation active false

# Find the line in "xrandr -q --verbose" output that contains current screen orientation and "strip" out current orientation.

rotation="$(xrandr -q --verbose | grep 'connected' | egrep -o  '\) (normal|left|inverted|right) \(' | egrep -o '(normal|left|inverted|right)')"

# Using current screen orientation proceed to rotate screen and input devices.

case "$rotation" in
    normal)
    # rotate to the left
    xrandr -o left
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate ccw
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate ccw
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate ccw
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
    xrandr -o right
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate cw
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate cw
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate cw
    ;;
    right)
    # rotate to normal
    xrandr -o normal
    xsetwacom set "Wacom ISDv4 E6 Pen stylus" rotate none
    xsetwacom set "Wacom ISDv4 E6 Pen eraser" rotate none
    xsetwacom set "Wacom ISDv4 E6 Finger touch" rotate none
    ;;
esac
