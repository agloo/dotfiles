#!/bin/bash
# Get colors
wd="$(dirname $0)"
git clone git://git.2f30.org/colors.git
cd ./colors
make
mv colors ../looks
cd ..
rm -rf colors
