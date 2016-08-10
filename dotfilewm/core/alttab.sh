#!/bin/bash
wd=$(dirname $0)
case $1 in
    'n')#next window
        wid=$(lsw|grep -v $(pfw)|sed '1 p;d');
        $wd/focchange.sh -t "$wid";;
    'p')#previous window
        wid=$(lsw|grep -v $(pfw)|sed '$ p;d');
        $wd/focchange.sh "$wid";;
esac
