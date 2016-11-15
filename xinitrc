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
~/.derswm/main.sh &
sxhkd &
# **** ****
pulseaudio &
sh ~/.fehbg &
urxvt -e ~/.derswm/welcome.sh &
redshift &
urxvtd
