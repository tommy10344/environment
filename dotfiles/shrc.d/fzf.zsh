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

# history
function fzf-history-selection () {
    BUFFER=$(history -n 1 | awk '!a[$0]++' | fzf --reverse -i +m)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-history-selection
bindkey '^R' fzf-history-selection

# Platform specific
case ${OSTYPE} in
    darwin*)
        # for MacOS
        # Lists files recursively and "open" selected one
        function fzf-open() {
            local file=$(find . -type f > /dev/null | fzf --reverse -i +m)
            if [ -n "$file" ]; then
                BUFFER="open ${file}"
                zle accept-line
            fi
            zle clear-screen
        }
        zle -N fzf-open
        bindkey '^o' fzf-open
esac
