#!/bin/bash
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
#[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources

# Make a thinkpad X220 MMB work as a button for things like blender.
xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Scroll Method Enabled" 0 0 0

# Keybindings
exec sxhkd &
# Bar
exec ~/.config/polybar/launch.sh &
# Wallpaper
exec ~/.fehbg &
# WM
exec bspwm &
# Redshift and systray icon
exec redshift-gtk &
# NetworkManager systray icon
exec nm-applet &
# Automount usb sticks. pkill this to end your session
exec udiskie &
# Terminal daemon to save muh cycles
exec urxvtd
