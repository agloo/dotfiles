#!/bin/bash
#Formatting and ideas pretty directly plagiarized (with love!) from z3bra and Kamiru_.

#Get where we are:
wd="$(dirname $0)"

#initialize the current group to 0
while IFS=: read ev wid; do
    wattr o "$wid"
    if [[ "$?" -eq 0 ]]; then
        continue
    fi
    case $ev in
            #handles mouseover focus. Pretty sure you need a wm to pull this off.
            7) $wd/focchange.sh $wid;;
            #Focus a window upon its creation.
            16)
                $wd/focchange.sh $wid t; wmv -a $(wmp) "$wid";;
            #Window deletion.
            18)
				$wd/alttab.sh p;;

    esac
done
