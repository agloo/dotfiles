#!/bin/bash
# A working copy of arch linux is assumed. Only feh and wmutils are needed for all of this to work.
wd=$(basename $0)
mkdir -p $wd/backups
for FN in $(ls); do
	mv ~/.FN $wd/backups
	ln -s $FN ~/.$FN
done

# Install the wm if it's not installed yet.
~/.dotfilewm/install.sh
