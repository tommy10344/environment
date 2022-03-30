call plug#begin()

Plug 'tpope/vim-endwise'
Plug 'kana/vim-smartinput'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'
Plug 'itchyny/lightline.vim'


" ----- coc.nvim -----
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ----- vim-easymotion -----
Plug 'easymotion/vim-easymotion'
map <Leader><Leader> <Plug>(easymotion-prefix)


" ----- nerdcommenter -----
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle


" ----- vim-grepper -----
Plug 'mhinz/vim-grepper'
command! Grep Grepper


" ----- vim-fugitive -----
Plug 'tpope/vim-fugitive'
nnoremap gs :<C-u>Git status<CR>
nnoremap gd :<C-u>Git diff<CR>
nnoremap gb :<C-u>Git blame<CR>


" ----- fern.vim -----
Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-git-status.vim'
let g:fern#default_hidden=1
let g:fern_git_status#disable_ignored = 1
let g:fern_git_status#disable_untracked = 1
let g:fern_git_status#disable_submodules = 1
let g:fern_git_status#disable_directories = 1

" Open file explorer
nnoremap <Leader><Leader>b :<C-u>Fern . -drawer<CR>

" Shows current file in file explorer
nnoremap <Leader><Leader>j :<C-u>:Fern . -drawer -reveal=%<CR>
command! Reveal Fern . -drawer -reveal=%


" ----- fzf.vim -----
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <Leader><Leader>o :call FzfFiles()<CR>

function! FzfFiles() abort
    if isdirectory('.git')
        GFiles
    else
        Files
    endif
endfunction


" ----- Swift -----
Plug 'keith/swift.vim'

call plug#end()
