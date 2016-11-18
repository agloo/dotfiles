#!/bin/bash
# A fresh working copy of arch linux is assumed.
# feh, fish, wmutils, and sxhkd are needed for all of this to work.
wd=$(dirname "$(readlink f $0)")
cd $wd
mkdir -p $wd/backups

# Copy files over:
# Dotfilewm (Just copied for ease in pathing):
[ -e ~/.dotfilewm ] && mv ~/.dotfilewm $wd/backups 
cp -r $wd/dotfilewm ~/.dotfilewm

# xinitrc
[ -e ~/.xinitrc ] && mv ~/.xinitrc $wd/backups
ln $wd/xinitrc ~/.xinitrc

# Xdefaults
[ -e ~/.Xdefaults ] && mv ~/.Xdefaults $wd/backups
ln $wd/Xdefaults ~/.Xdefaults

# Vimrc
[ -e ~/.vimrc ] && mv ~/.vimrc $wd/backups
ln $wd/vimrc ~/.vimrc

# sxhkd:
mkdir -p ~/.config/sxhkd
[ -e ~/.config/sxhkd/sxhkdrc ] && mv ~/.config/sxhkd/sxhkdrc $wd/backups
ln  $wd/sxhkdrc ~/.config/sxhkd/sxhkdrc

# fish:
[ -e ~/.Xdefaults ] && mkdir -p ~/.config/fish
[ -e ~/.config/fish/config.fish ] && mv ~/.config/fish/config.fish $wd/backups
ln  $wd/config.fish ~/.config/fish/config.fish

# Install the wm if it's not installed yet.
~/.dotfilewm/install.sh
