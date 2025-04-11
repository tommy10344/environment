scriptencoding utf-8

if &compatible
    set nocompatible
endif
set number
set ruler
set hlsearch
set cursorline
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,utf-16,utf-16le
set backspace=indent,eol,start
set nrformats=
set visualbell t_vb=
syntax on

" 長い行は折り返し表示
set wrap

" 編集中ファイルを保存せずにバッファを切り替えられるようにする
set hidden

" Indent
set autoindent
set cindent
set expandtab
set tabstop=4
set shiftwidth=4

" Temprary file
set nobackup
set nowritebackup
set noswapfile
set noundofile
" set viminfo=

" Tabを常に表示
set showtabline=2

" 小文字のみで入力の場合 -> 大文字小文字を区別しない
" 大文字混在で入力の場合 -> 大文字小文字を区別する
set ignorecase
set smartcase

" コマンド補完
set wildmenu

" □や○を崩れないように表示する
set ambiwidth=double

" conceal無効
set conceallevel=0

" 自動改行をしない
set textwidth=0
" Kaoriya版MacVimのtextwidth対策
augroup vimrc-textwidth-kaoriya
    autocmd!
    autocmd FileType text setlocal textwidth=0
augroup END

if !has('gui_running')
  set t_Co=256
endif

" yankしたテキストをクリップボードに入れる
set clipboard+=unnamed

""""""""""""""""""""""""""""""""""""""""
" path
"
"
call Add_path('/usr/local/include')
call Add_path('~/include')

call Add_PATH('/usr/local/bin')
call Add_PATH('~/bin')
call Add_PATH('~/.local/bin')
" call Add_PATH('~/.pyenv/shims')

" :vimgrep xxx ** と同様
" command! -nargs=1 Grep call s:grep_recursive(<f-args>)
" function! s:grep_recursive(pattern)
"     execute 'vimgrep /' . a:pattern . '/j ** | cw'
" endfunction

" vimrc編集時の自動リロード
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


" ディレクトリ以下の「.vimrc_local」を探し、存在する場合は適用(source)する
augroup vimrc-local
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
    autocmd BufReadPre .vimrc_local set ft=vim
augroup END
function! s:vimrc_local(loc) abort
    let files = findfile('.vimrc_local', escape(a:loc, ' ') . ';', -1)
    for i in reverse(filter(files, 'filereadable(v:val)'))
        source `=i`
    endfor
endfunction
