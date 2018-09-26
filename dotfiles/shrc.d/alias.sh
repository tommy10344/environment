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
alias vimrc="vim ~/.vimrc"

# git
alias gs="git status"
alias gf="git fetch --all"
alias gd="git diff"
alias gdc="git diff --cached"

# ruby
alias be="bundle exec"
