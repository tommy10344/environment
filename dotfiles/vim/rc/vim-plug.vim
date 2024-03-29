call plug#begin()

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'kana/vim-smartinput'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'
Plug 'itchyny/lightline.vim'
Plug 'vim-jp/vimdoc-ja'


" ----- coc.nvim -----
Plug 'neoclide/coc.nvim', {'branch': 'release'}
source ~/.vim/rc/plugins/coc.vim

" ----- vim-easymotion -----
Plug 'easymotion/vim-easymotion'
map <Leader><Leader> <Plug>(easymotion-prefix)


" ----- nerdcommenter -----
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle


" ----- vim-grepper -----
Plug 'mhinz/vim-grepper'
command! -nargs=+ F :GrepperRg <args>
command! -nargs=+ Find :GrepperRg <args>


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
