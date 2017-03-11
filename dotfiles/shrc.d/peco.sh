# cd
function peco_cd() {
    cd "$(find . -type d | peco)"  
}
alias cdp="peco_cd"

# ghq
alias srcp='cd $(ghq root)/$(ghq list | peco)'
