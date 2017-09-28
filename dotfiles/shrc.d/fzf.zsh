# cd
function fzf-cd() {
    cd "$(find . -type d | fzf --reverse -i +m)"  
}
zle -N fzf-cd
bindkey '^p' fzf-cd

# ghq
function fzf-ghq-cd () {
    local dir=$(ghq list -p > /dev/null | fzf --reverse -i +m)
    if [ -n "$dir" ]; then
        BUFFER="cd ${dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N fzf-ghq-cd
bindkey '^f' fzf-ghq-cd
