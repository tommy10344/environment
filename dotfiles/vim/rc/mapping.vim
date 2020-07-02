" Key mapping

" for US keyboard
nnoremap ; :
nnoremap : ;

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 行頭・行末に移動
nnoremap <Space>h 0
vnoremap <Space>h 0
nnoremap <Space>l $
vnoremap <Space>l $

" Tab
nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap <C-t> :<C-u>tabe<CR>
vnoremap <C-t> :<C-u>tabe<CR>
cnoremap <C-t> :<C-u>tabe<CR>

" 画面上の最初の行、最後の行に移動
nnoremap <Space>k H
vnoremap <Space>k H
nnoremap <Space>j L
vnoremap <Space>j L

" "0レジスタから貼付け
nnoremap <Space>p "0p
vnoremap <Space>p "0p

" tagsジャンプの時に複数ある時は一覧表示                                        
nnoremap <C-]> g<C-]> 

" 選択範囲を * で検索
vnoremap * "zy:let @/ = @z<CR>n

" Escape
inoremap jj     <Esc>
noremap <C-@>   <Esc>
noremap! <C-@>  <Esc>

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
    nnoremap T :<C-u>call SplitTerminal()<CR>
    nnoremap VT :<C-u>call VSplitTerminal()<CR>
    tnoremap <Esc>  <C-\><C-n>
    tnoremap <C-@>  <C-\><C-n>
    tnoremap <C-t> <C-\><C-n>:<C-u>tabe<CR>
else
    nnoremap T :<C-u>terminal<CR>
endif

" File explorer
" nnoremap F :<C-u>call OpenFileExplorer()<CR>
" nnoremap <C-j> :<C-u>call RevealInFileExplorer()<CR>
