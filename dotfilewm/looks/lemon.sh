#!/bin/bash
# Copied from arch tutorial (shaddap I'm lazy)
# Define the clock
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
        which=$(expr 1 - $which)
        sound=$(amixer get Master | egrep -o "[0-9]+%" -m 1)
				wifi=$(nmcli -t -f NAME connection show --active)
        echo -e "WS-$(cat /tmp/"$USER"_workspaces/curr)%{A:~/.dotfilewm/core/workspace.sh -p:} P%{A}%{A:~/.dotfilewm/core/workspace.sh -n:} N %{A} %{c}$bookend$(date '+%a %b %d,  %T')$bookend%{c} %{r} BAT-$power SND-$sound WFI-$wifi%{r}"
        sleep 1
 done
}
lemon_in | lemonbar -f profont -B $(grep "background" ~/.Xdefaults|rev|cut -c -7|rev) -F $(grep "foreground" ~/.Xdefaults|rev|cut -c -7|rev) -p -d -g 1000x10+183 -p | bash -e
