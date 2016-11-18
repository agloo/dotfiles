#!/bin/sh
# Constructs and groups windows into workspaces to switch between using your favorite keybinder.

NUM_WS=9

help() {
	cat << EOF
usage: $(basename $0) [-hinp] [-g ws_num] [-m ws_num]
	-h: Displays this message
	-i: Initialize workspaces. Should be called once in a startup script.
	-n: Move up one workspace
	-p: Move down one workspace
	-g, <ws_num>: go to the workspace specified by <ws_num>
	-m, <ws_num>: move the currently focused window to the worskpace specified by <ws_num>
EOF
	exit 1
}

# Synchronization helpers:
# This is very minimal implementation of a lock, but since our only
# requirement on synchronization is that a process doesn't switch while
# another is saving windows, it suffices.
lock_workstation() {
	if ! mkdir /tmp/"$USER"_workspaces/wslock.lock.d; then
		exit 1
	fi
}

release_workstation() {
	rmdir /tmp/"$USER"_workspaces/wslock.lock.d
}

# Initializes us in workspace 0.
ws_init() {
	mkdir -p /tmp/"$USER"_workspaces/
	i=0
	while [ $i -le $NUM_WS ]; do
		:> /tmp/"$USER"_workspaces/ws"$i"
		i=$(expr $i + 1)
	done
	echo 0 > /tmp/"$USER"_workspaces/curr
}

# Saves all mapped windows to the current workspace.
save_ws() {
	curr=$(cat /tmp/"$USER"_workspaces/curr)
	lsw > /tmp/"$USER"_workspaces/ws"$curr"
}

move_to_ws() {
  lock_workstation
	ws_num=$1
	if [ $ws_num -gt $NUM_WS ] || [ $ws_num -lt 0 ]; then
		echo "Workspace not found"
		return
	fi
	save_ws
	mapw -u $(lsw)
	mapw -m $(cat /tmp/"$USER"_workspaces/ws"$ws_num")
	echo $ws_num > /tmp/"$USER"_workspaces/curr
  release_workstation
}

next_ws() {
	# Get what ws we're currently in.
	curr=$(cat /tmp/"$USER"_workspaces/curr)
	curr=$(expr $curr + 1)

	# Take care of loopback.
	if [ $curr -gt $NUM_WS ]; then
		curr=0
	fi

	move_to_ws $curr
}

prev_ws() {
	# Get what ws we're currently in.
	curr=$(cat /tmp/"$USER"_workspaces/curr)
	curr=$(expr $curr - 1)

	# Take care of loopback.
	if [ $curr -lt 0 ]; then
		curr=$NUM_WS
	fi

	move_to_ws $curr
}

move_focused_window() {
	ws_num=$1
	if [ $ws_num -gt $NUM_WS ] || [ $ws_num -lt 0 ]; then
		echo "Workspace not found"
		return
	fi
	wid=$(pfw)
	curr_ws=$(cat /tmp/"$USER"_workspaces/curr);
	if [ $wid != curr_ws ]; then
		pfw >> /tmp/"$USER"_workspaces/ws"$1"
		mapw -u $wid
	fi
}

while getopts ":m:g:npi" opt; do
	case $opt in
		n)
			next_ws;;
		p)
			prev_ws;;
		g)
			move_to_ws $OPTARG;;
		m)
			move_focused_window $OPTARG;;
		i)
			ws_init;;
		\?)
			help;;
	esac
done
