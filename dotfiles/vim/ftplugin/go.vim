""""""""""""""""""""""""""""""""""""""""
" Go(golang) settings
"

" vim-go
au FileType go nmap <Space>r <Plug>(go-run)
au FileType go nmap <Space>b <Plug>(go-build)
au FileType go nmap <Space>t <Plug>(go-test)
au FileType go nmap <Space>c <Plug>(go-coverage)
au FileType go nmap <Space>gd <Plug>(go-doc)
au FileType go nmap <Space>gv <Plug>(go-doc-vertical)
au FileType go nmap <Space>gb <Plug>(go-doc-browser)
au FileType go nmap <Space>s <Plug>(go-implements)
au FileType go nmap <Space>i <Plug>(go-info)
au FileType go nmap <Space>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
