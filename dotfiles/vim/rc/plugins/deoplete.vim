""""""""""""""""""""""""""""""""""""""""
" deoplete
"

let g:deoplete#enable_at_startup = 1

inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><Esc> pumvisible() ? deoplete#cancel_popup() : "\<Esc>"

" if !exists('g:deoplete#omni_patterns')
"     let g:deoplete#omni_patterns = {}
" endif
" " let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
" let g:deoplete#omni_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'
