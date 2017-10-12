""""""""""""""""""""""""""""""""""""""""
" Go(golang) settings
"

" vim-go
augroup vimrc-go
    autocmd!
    au FileType go nmap <Space>r <Plug>(go-run)
    au FileType go nmap <Space>b <Plug>(go-build)
    au FileType go nmap <Space>t <Plug>(go-test)
    au FileType go nmap <Space>C <Plug>(go-coverage)
    au FileType go nmap <Space>D <Plug>(go-doc)
    au FileType go nmap <Space>V <Plug>(go-doc-vertical)
    au FileType go nmap <Space>B <Plug>(go-doc-browser)
    au FileType go nmap <Space>s <Plug>(go-implements)
    au FileType go nmap <Space>i <Plug>(go-info)
    au FileType go nmap <Space>e <Plug>(go-rename)
augroup end

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
