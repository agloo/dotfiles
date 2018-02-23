# Typically a package manager would handle dependencies on a package,
# but dotfiles are in this weird place where there is no good way to
# require that software is installed in order to configure it.
# To combat this in a way that hopefully won't go stale, I'm going
# to just assume that I'm using arch linux with yaourt and get everything
# I want with hard coded commands.
sudo pacman -S bspwm \
							 bdf-unifont \
							 dmenu \
							 tmux \
							 gvim \
							 sxhkd \
							 feh \
							 redshift

yaourt -S vundle \
					polybar \
					phallus-fonts-git
