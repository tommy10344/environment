call plug#begin()

Plug 'tpope/vim-endwise'
Plug 'kana/vim-smartinput'
Plug 'editorconfig/editorconfig-vim'


" ----- vim-easymotion -----
Plug 'easymotion/vim-easymotion'
map <Space><Space> <Plug>(easymotion-prefix)


" ----- nerdcommenter -----
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
nmap <Space>c <Plug>NERDCommenterToggle
vmap <Space>c <Plug>NERDCommenterToggle


" ----- lightline.vim -----
Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'solarized' }


" ----- vim-fugitive -----
Plug 'tpope/vim-fugitive'
nnoremap gs :<C-u>Gstatus<CR>
nnoremap gd :<C-u>Gdiff<CR>
nnoremap gb :<C-u>Gblame<CR>


" ----- fern.vim -----
Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-git-status.vim'
let g:fern#default_hidden=1
let g:fern_git_status#disable_ignored = 1
let g:fern_git_status#disable_untracked = 1
let g:fern_git_status#disable_submodules = 1
let g:fern_git_status#disable_directories = 1
" Open file explorer
nnoremap F :<C-u>Fern . -drawer<CR>
" Shows current file in file explorer
nnoremap J :<C-u>:Fern . -drawer -reveal=%<CR>


" ----- fzf.vim -----
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap P :<C-u>Files<CR>


call plug#end()
