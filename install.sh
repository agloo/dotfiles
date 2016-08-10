#!/bin/bash
# A clean arch linux installation is assumed. You can replace the pacman commands with your package manager of choice and they will work.
cp xinitrc ~/.xinitrc
cp config.fish ~/.config/fish/
cp sxhkdrc ~/.config/sxhkd/
cp vimrc ~/.vimrc
cp Xdefaults ~/.Xdefaults
cp -r dotfilewm ~/.dotfilewm
~/.dotfilewm/install.sh
