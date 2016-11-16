# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Set the locale.
# You have to do this manually if you don't have a DE.
if test -r /etc/locale.conf
    while read -l kv
        set -gx (string split "=" -- $kv)
    end </etc/locale.conf
end

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/anders/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Sorry, fish. I need my compatiblity.
set -x SXHKD_SHELL /usr/bin/bash

# Make the default editor vim
set -x VISUAL vim

# Gotta listen to muh daemon.
alias bk "cd ~/berk"
alias urxvt "urxvtc -e refr"
alias refr "~/.derswm/looks/term_recolor.sh < ~/.Xresources"
alias wallchange ~/.derswm/looks/wallchange.sh
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias 162 "cd ~/berk/162/vm"
alias nsa "sudo netctl stop-all"
alias nab "sudo netctl start AB"
alias steb "sudo netctl start steb"
alias todo "vim ~/todo"
alias sched "vim ~/sched"
alias vi "vim"
alias rswf "./.rswf"
