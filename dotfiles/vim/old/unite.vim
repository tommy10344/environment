""""""""""""""""""""""""""""""""""""""""
" unite
"
let g:unite_enable_start_insert = 1

" Unite history/yank を有効化
let g:unite_source_history_yank_enable = 1

" ファイル選択
function! MyUniteOpen()
    let file_rec = ''
    if has('nvim')
        let file_rec = "file_rec/neovim"
    elseif isdirectory(getcwd()."/.git")
        let file_rec = "file_rec/git"
    else
        let file_rec = "file_rec/async"
    endif
    execute 'Unite' file_rec 'file_mru' 'tag' 'outline'

    " for NeoBundle
    " if ! empty(neobundle#get('vimproc'))
        " if isdirectory(getcwd()."/.git")
            " Unite file_rec/git
        " else
            " Unite file_rec/async
        " endif
    " else
          " Unite file_rec
    " endif
endfunction
nnoremap <Space>: :<C-u>Unite command mapping<CR>
nnoremap <Space>o :<C-u>call MyUniteOpen()<CR>
nnoremap <Space>d :<C-u>Unite directory<CR>
nnoremap <Space>g :<C-u>Unite grep<CR>
nnoremap <Space>t :<C-u>Unite tag<CR>
" nnoremap <Space>l :<C-u>Unite outline<CR>
nnoremap <Space>b :<C-u>Unite buffer<CR>
nnoremap <Space>r :<C-u>Unite register<CR>
nnoremap <Space>m :<C-u>Unite file_mru<CR>
" nnoremap <Space>y :<C-u>Unite history/yank<CR>
nnoremap <Space>f :<C-u>Unite line<CR>

command! UniteOpen :call MyUniteOpen()
command! UniteGrep :Unite grep
command! UniteOutline :Unite outline
command! UniteTag :Unite tag
command! UniteBuffer :Unite buffer
command! UniteRegister :Unite register
command! UniteDein :Unite dein
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" unite grep
"
if executable('ag')
    " grepにag(The Silver Searcher) を使う
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --vimgrep --hidden --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" unite file
"
" 無視パターン
call unite#custom#source('file_rec,file_rec/async,file_rec/git,file_rec/neovim', 'ignore_pattern', 'node_modules')
""""""""""""""""""""""""""""""""""""""""
