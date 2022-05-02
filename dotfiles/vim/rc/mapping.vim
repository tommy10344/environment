" Key mapping

let mapleader = "\<Space>"

" for US keyboard
nnoremap ; :
nnoremap : ;

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 表示行単位で上下移動
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
" 逆パターン
nnoremap gj j
nnoremap gk k

" 行頭・行末に移動
nnoremap <Leader>h 0
vnoremap <Leader>h 0
nnoremap <Leader>l $
vnoremap <Leader>l $

" Tab
nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap <C-t> :<C-u>tabe<CR>
nnoremap <Leader>t :<C-u>tabe<CR>

" Buffer
nnoremap <C-k> :<C-u>bprevious<CR>
nnoremap <C-j> :<C-u>bnext<CR>

" 画面上の最初の行、最後の行に移動
nnoremap <Leader>k H
vnoremap <Leader>k H
nnoremap <Leader>j L
vnoremap <Leader>j L

" "0レジスタから貼付け
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" 選択範囲を * で検索
vnoremap * "zy:let @/ = @z<CR>n

" Escape
inoremap jj     <Esc>

" Search
nnoremap <ESC><ESC> :<C-u>nohlsearch<CR>
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Command mode mapping
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>
cnoremap <C-h>  <Left>
cnoremap <C-l>  <Right>
cnoremap <C-d>  <Del>
" paste
cnoremap <C-p>  <C-r>*

" Terminal
if has('nvim')
    nnoremap <Leader><Leader>` :<C-u>call SplitTerminal()<CR>
    tnoremap <Esc>  <C-\><C-n>
    tnoremap <C-@>  <C-\><C-n>
    tnoremap <C-t> <C-\><C-n>:<C-u>tabe<CR>
else
    nnoremap <Leader><Leader>` :<C-u>terminal<CR>
endif
