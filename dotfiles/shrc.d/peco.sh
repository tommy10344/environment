# cd
function peco-cd() {
    cd "$(find . -type d | peco)"  
}
# alias pcd="peco-cd"
zle -N peco-cd
bindkey '^p' peco-cd

# ghq
function peco-ghq-cd () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-ghq-cd
bindkey '^f' peco-ghq-cd
