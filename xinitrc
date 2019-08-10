#!/bin/bash
# The thing everyone says you should have.
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Load color schemes.
[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults

## Utility startup stuff ------------------------
# Keybindings
sxhkd &
# WM
bspwm &
# Wallpaper
~/.fehbg &
# Bar
~/.config/polybar/launch.sh &
# Redshift and systray icon
redshift-gtk &
# Automount usb sticks.
udiskie &

## My specific setup -----------------------------
# Make a thinkpad X220 MMB work as a button for things like blender.
xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Scroll Method Enabled" 0 0 0 &
## Audio
jackd
# Make pulse and jack play nicely.
pactl load-module module-jack-sink channels=2; pactl load-module module-jack-source channels=2; pacmd set-default-sink jack_out
## For piano:
# Forward midi from alsa to jack.
a2jmidid -e &
# Start Linuxsampler with my piano samples in it.
# It gets code vomity so I just put a function in my bashrc.
piano &

## Login anchor ---------------------------------
# pkill this to kill the login
exec urxvtd
