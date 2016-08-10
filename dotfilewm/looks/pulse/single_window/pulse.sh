#!/bin/sh
wd=$(dirname $0)
python2 $wd/peak_detect.py | $wd/sound.sh
