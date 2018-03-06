# Typically a package manager would handle dependencies on a package,
# but dotfiles are in this weird place where there is no good way to
# require that software is installed in order to configure it.
# To combat this in a way that hopefully won't go stale, I'm going
# to just assume that I'm using arch linux with yaourt and get everything
# I want with hard coded commands.
sudo pacman -S bspwm \ # The whole wm.
							 bdf-unifont \ # Nice bitty font for unicode in terminal and bar.
							 tmux \ #Just a big part of my workflow.
							 gvim \ # For life.
							 sxhkd \ # For hotkeys.
							 dmenu \ # default application launcher in my hotkeys.
							 feh \ # For wallpapers.
							 xcb-util-xrm \ # Not sure if this won't be included. Just need it for polybar.
							 redshift # Just nice on my eyes.
							 udiskie # Automount USB disks.

yaourt -S vundle \ # To make my vimrc work
					polybar \ # Used as systray and just generally a good bar.
					phallus-fonts-git # my favorite fonts for terminal use. Don't judge.
