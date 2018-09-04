""""""""""""""""""""""""""""""""""""""""
" Configurations for w0rp/ale: Asynchronous Lint Engine
"

let g:ale_fix_on_save = 1

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fixers['typescript'] = ['tslint']
let g:ale_fixers['vue'] = ['eslint']
