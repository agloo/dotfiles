#!/bin/bash
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# TODO stop being lazy
[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
#[[ -f ~/.Xresources]] && xrdb -override ~/.Xresources
#######
#SHOULDN'T YOU BE DOING SOMETHING PRODUCTIVE?
twm &
~/.derswm/main.sh &
sxhkd &
########
pulseaudio &
#use this if you're not going to change the wp every time.
sh ~/.fehbg &
urxvt -e ~/.derswm/welcome.sh || pkill urxvt
urxvtd
