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
# Make pulseaudio run inside jack, for audio applications.
#cadence-session-start --system-start
# Redshift and systray icon
exec redshift-gtk &
# NetworkManager systray icon. Not working.
# exec nm-applet &
# Automount usb sticks.
exec udiskie &
# Terminal daemon to save muh cycles
exec urxvtd
