#!/bin/bash
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources
# ****WM:****
~/.dotfilewm/main.sh &
export WIDTH=$(xrandr | grep \* | cut -c 4-11 | cut -d x -f 1)
export HEIGHT=$(xrandr | grep \* | cut -c 4-11 | cut -d x -f 2)
sxhkd &
# **** ****
# Automount USBs
udiskie -2 -s &
# Sound
pulseaudio &
# Background
sh ~/.fehbg &
# Flux clone
redshift &
# Terminal daemon. Kill to close the xsession.
urxvtd
