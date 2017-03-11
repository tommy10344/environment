""""""""""""""""""""""""""""""""""""""""
" blockdiag
call PutQuickrunConfig('blockdiag', {
            \ 'command'     : 'blockdiag',
            \ 'cmdopt'      : '--antialias',
            \ 'runner'      : 'vimproc',
            \ })
augroup blockdiag
    autocmd!
    autocmd BufWritePost *.diag QuickRun
    autocmd BufWritePost *.blockdiag QuickRun
augroup end
""""""""""""""""""""""""""""""""""""""""
