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
twm &
~/.dotfilewm/main.sh &
export WIDTH=$(xrandr | grep \* | cut -c 4-11 | cut -d x -f 1)
export HEIGHT=$(xrandr | grep \* | cut -c 4-11 | cut -d x -f 2)
sxhkd &
# **** ****
pulseaudio &
sh ~/.fehbg &
urxvt -e ~/.dotfilewm/welcome.sh &
redshift &
urxvtd
