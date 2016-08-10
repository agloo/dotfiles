#!/bin/sh
wd="$(dirname $0)"
wew | $wd/core/Xhandler.sh &
$wd/core/workspace.sh -i &
$wd/looks/border.sh &
$wd/looks/lemon.sh
