#!/bin/bash
# Get colors
wd="$(dirname $0)"
git clone git://git.2f30.org/colors.git
cd ./colors
make
mv colors ../looks
cd ..
rm -rf colors

# Get the older working version of wew
git clone https://github.com/agloo/opt.git
cd opt
make
mv wew ../core/goodwew
cd ..
rm -rf opt
