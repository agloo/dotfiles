#!/bin/bash
# Credit for Clock goes to archwiki
Clock() {
        DATETIME=$(date "+%a %b %d, %T")

        echo -n "$DATETIME"
}
lemon_in ()
{
which=0
while :; do
        #for power:
        tmp=$(acpi -b)
        tmp=${tmp%\%*}
        power=$(echo "$tmp%" | cut -c 12- | rev | cut -f1 -d " " | rev)

        bookend="   ҈"
        if [ $which -eq 0 ]; then
            bookend="   ҉"
        fi
        which=$(expr 1 - $which)
        sound=$(amixer get Master | egrep -o "[0-9]+%" -m 1)
        wifi=$(netctl list | grep \* | cut -c 3-)
        LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
        cpu=$(bc <<< $LINE)
        echo -e "WS-$(cat /tmp/workspaces/curr) CPU-$cpu% %{c}$bookend$(date '+%a %b %d,  %T')$bookend%{c} %{r} BAT-$power SND-$sound WFI-$wifi%{r}"
        sleep 1
 done
}
lemon_in | lemonbar -f profont -B $(grep "background" ~/.Xdefaults|rev|cut -c -7|rev) -F $(grep "foreground" ~/.Xdefaults|rev|cut -c -7|rev) -p -d -g 1000x10+183 -p
