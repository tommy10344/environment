alias ll="ls -l"
alias la="ls -a"
alias grep="grep --color"
alias cl="clear"
alias cls="clear"
alias mkdirtoday="mkdir $(date +'%Y-%m-%d')"
alias cdtoday="cd $(date +'%Y-%m-%d')"

# vim
if type ${HOME}/neovim/bin/nvim > /dev/null 2>&1; then
    alias vim="nvim"
fi

# git
alias gstatus="git status"
alias gs="gstatus"

alias gdiff="git diff"
alias gd="gdiff"

alias gdiffcached="git diff --cached"
alias gcd="gdc"

alias glog="git log --graph --all --oneline"
alias gl="glog"

alias gadd="git add"
alias ga="gadd"
alias gap="gadd -p"

alias gcommit="git commit"
alias gc="gcommit"

alias gpush="git push"
alias gpull="git pull"
alias gfetch="git fetch"
alias gswitch="git switch"
alias grestore="git restore"

# ruby
alias be="bundle exec"

# Android
alias android_studio="open -a /Applications/Android\ Studio.app"
