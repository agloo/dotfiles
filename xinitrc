#!/bin/bash
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources

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
# Terminal daemon to save muh cycles
exec urxvtd
