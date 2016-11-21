#!/bin/bash
wd=$(dirname $0)
fw=$(pfw)
case $1 in
    'n')#next window
				if [ $fw ]; then
					wid=$(lsw|grep -v "$fw"|sed '1 p;d')
				else
					wid=$(lsw|sed '1 p;d')
				fi
				$wd/focchange.sh -t "$wid";;

    'p')#previous window
				if [ $fw ]; then
					wid=$(lsw|grep -v $fw|sed '$ p;d')
				else
					wid=$(lsw|sed '$ p;d')
				fi
				$wd/focchange.sh "$wid";;
esac
