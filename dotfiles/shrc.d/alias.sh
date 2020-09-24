alias ls="ls -G"
alias ll="ls -lh"
alias la="ls -a"
alias lla="ll -a"
alias grep="grep --color"
alias cl="clear"
alias cls="clear"
alias mkdirtoday="mkdir $(date +'%Y-%m-%d')"
alias cdtoday="cd $(date +'%Y-%m-%d')"

# vim
# if type ${HOME}/neovim/bin/nvim > /dev/null 2>&1; then
    # alias vim="nvim"
# fi
alias vim="nvim"

# git
alias g="git"

alias gstatus="git status"
alias gs="gstatus"

alias gbranch="git branch"
alias gb="gbranch"

alias gdiff="git diff"
alias gd="gdiff"

alias gdiffcached="git diff --cached"
alias gdc="gdiffcached"

alias glog="git log --graph --all --oneline"
alias gl="glog"

alias gadd="git add"
alias ga="gadd"
alias gap="gadd -p"

alias gcommit="git commit"
alias gc="gcommit"

alias gfetch="git fetch"
alias gfetchprune="git fetch --prune"
alias gf="gfetch"
alias gfp="gfetchprune"

alias gswitch="git switch"
alias gswitch-fzf="git branch | fzf | xargs git switch"
alias gswf="gswitch-fzf"

alias grebase="git rebase"
alias gpush="git push"
alias gpull="git pull"
alias grestore="git restore"
alias gstash="git stash"
alias gsubmodule="git submodule"
alias gremote="git remote"

# ruby
alias be="bundle exec"

# Android
alias android_studio="open -a /Applications/Android\ Studio.app"
