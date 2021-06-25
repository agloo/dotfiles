PROMPT='%~ %(?.%F{green}.%F{red})☭ %F{240}'
PROMPT_COMMAND=minibell$'\n'"$PROMPT_COMMAND"

# Fundies
alias ls='ls -GH'
alias dw="cd ~/Downloads"
alias v="vim"
alias vi="vim"

# OSX aliases to && after long running commands.
alias minibell="say 鐘"
alias bell="say bleep blop bloopity"

# git stuff
alias main="git checkout main"
alias gap="git add -p"
alias gcp="git checkout -p"
alias gb="git branch"
alias gdc="git diff --cached"
alias gd="git diff"
alias gp="git pull"
alias gs="git status"
