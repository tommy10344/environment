function! s:customize_vaffle_mappings() abort
    " Customize key mappings here
    nmap K <Plug>(vaffle-mkdir)
    nmap N <Plug>(vaffle-new-file)
endfunction

augroup vimrc_vaffle
    autocmd!
    autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END
