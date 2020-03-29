" https://github.com/prabirshrestha/asyncomplete.vim

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 200

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
inoremap <expr><Esc> pumvisible() ? asyncomplete#cancel_popup() : "\<Esc>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
