#!/bin/bash
# Get colors
wd="$(dirname $0)"
git clone git://git.2f30.org/colors.git
cd ./colors
make
mv colors ../looks
cd ..
rm -rf colors

# Get alt+tab and focus manager
git clone https://github.com/patrickhaller/no-wm.git
cd no-wm
make
mv x-alt-tab ../core
mv x-focus-manager ../core
cd ..
rm -rf no-wm
