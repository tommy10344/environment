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

" タブ移動
nnoremap <C-h> gT
nnoremap <C-l> gt

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
if has('nvim')
    tnoremap <Esc>  <C-\><C-n>
    tnoremap <C-@>  <C-\><C-n>
endif

" Command mode mapping
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>
cnoremap <C-h>  <Left>
cnoremap <C-l>  <Right>
cnoremap <C-d>  <Del>
" paste
cnoremap <C-p>  <C-r>*
