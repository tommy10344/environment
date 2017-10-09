neovim_autocd() {
    [[ $NVIM_LISTEN_ADDRESS ]] && neovim-autocd.py
}
chpwd_functions+=( neovim_autocd )
