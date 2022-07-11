PROMPT='%~ %(?.%F{green}.%F{red})☭ %F{240}'
RPROMPT=\$vcs_info_msg_0_

# Fundies
alias ls='ls -GH'
alias dw="cd ~/Downloads"
alias v="vim"
alias vi="vim"
alias gerp="grep -siIr ."

# OSX aliases to && after long running commands.
alias minibell="say 鐘"
alias bell="say bleep blop bloopity"
alias x="xcodebuild"

# Cscope. There could likely be done better with some kind of plugin,
# maybe gutentags, but for now I don't work in enough different projects to care.
export CSCOPE_BASE="PUTWHATYOUWANTFORYOURCSCOPEROOTHERE"
export CSCOPE_DB=$CSCOPE_BASE/cscope.out
alias scop="cd $CSCOPE_BASE && cscope -d; cd - > /dev/null"
alias mkscop="cd $CSCOPE_BASE && cscope -Rbq"

# git stuff
#Aliases:
alias main="git checkout main"
alias gap="git add -p"
alias gb="git branch"
alias gcm="git commit -m"
alias gcp="git checkout -p"
alias gdc="git diff --cached"
alias gd="git diff"
alias gl="git log"
alias gpl="git pull"
alias gps="git push"
alias gs="git status"
alias gsh="git show"
# git branch in Prompt:
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

# Keep a separate file for any anliases others
# have a vested interest in keeping private.
source .zshcorp
