#!/bin/bash
# A fresh working copy of arch linux is assumed.
# fish, wmutils, and 2bwm are needed for all of this to work.
wd=$(dirname $0)
cd $wd
if [ -d "$wd/backups" ]; then
	echo "Error: Deal with your old backups before you reinstall."
	exit 0
fi
mkdir -p $wd/backups

# xinitrc
[ -e ~/.xinitrc ] && mv ~/.xinitrc $wd/backups
ln ./xinitrc ~/.xinitrc

# background
echo "Put your logic to your wallpaper in .fehbg (one is included)"

# Xdefaults
[ -e ~/.Xdefaults ] && mv ~/.Xdefaults $wd/backups
ln ./Xdefaults ~/.Xdefaults

# Vimrc
[ -e ~/.vimrc ] && mv ~/.vimrc $wd/backups
ln ./vim/vimrc ~/.vimrc

# Custom color scheme
[ -e ~/.vim/colors/termcolors.vim ] && mv ~/.vim/colors/termcolors.vim $wd/backups
ln ./vim/termcolors.vim ~/.vim/colors/termcolors.vim

# sxhkd
mkdir -p ~/.config/sxhkd
[ -e ~/.config/sxhkd/sxhkdrc ] && mv ~/.config/sxhkd/sxhkdrc $wd/backups
ln ./hotkeys/sxhkdrc ~/.config/sxhkd/sxhkdrc

# bar
mkdir -p ~/.config/polybar
[ -e ~/.config/polybar/config ] && mv ~/.config/polybar/config $wd/backups
ln ./polybar/config ~/.config/polybar/config
[ -e ~/.config/polybar/launch.sh ] && mv ~/.config/polybar/launch.sh $wd/backups
ln ./polybar/launch.sh ~/.config/polybar/launch.sh

# bspwm
mkdir -p ~/.config/bspwm
[ -e ~/.config/bspwm/bspwmrc ] && mv ~/.config/bspwm/bspwmrc $wd/backups
ln ./bspwmrc ~/.config/bspwm/bspwmrc

# If you want to use fish:
# [ -e ~/.config/fish/config.fish ] && mv ~/.config/fish/config.fish $wd/backups
# ln  ./shell/config.fish ~/.config/fish/config.fish

# If you want to use bash:
[ -e ~/.bashrc ] && mv ~/.bashrc $wd/backups
ln  ./shell/bashrc ~/.bashrc

echo "done"
