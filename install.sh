#!/bin/bash
# This just copies out config files for the shell, vim and tmux--no extra color schemes.
# Backups are saved in the backups folder of this directory.
wd=$(dirname $0)
cd $wd
if [ -d "$wd/backups" ]; then
	echo "Error: Deal with your old backups before you reinstall."
	exit 0
fi
mkdir -p $wd/backups

# zsh config
[ -e ~/.zshrc ] && mv ~/.zshrc $wd/backups
ln ./zshrc ~/.zshrc

# Vimrc
[ -e ~/.vimrc ] && mv ~/.vimrc $wd/backups
ln ./vim/vimrc ~/.vimrc

# Custom color scheme
mkdir -p ~/.vim/colors
[ -e ~/.vim/colors/termcolors.vim ] && mv ~/.vim/colors/termcolors.vim $wd/backups
ln ./vim/termcolors.vim ~/.vim/colors/termcolors.vim

# tmux.conf
[ -e ~/.tmux.conf ] && mv ~/.tmux.conf $wd/backups
ln ./tmux.conf ~/.tmux.conf

echo "done"
