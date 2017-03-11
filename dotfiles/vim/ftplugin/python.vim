setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

" jediでの補完時に補完候補が選択されてしまう対策
setlocal omnifunc=jedi#completions

"let g:jedi#popup_select_first=0    " 効かないらしい
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
""""""""""""""""""""""""""""""""""""""""
