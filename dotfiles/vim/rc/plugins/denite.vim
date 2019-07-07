""""""""""""""""""""""""""""""""""""""""
" Denite.nvim
"

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction


nnoremap <Space>o :<C-u>Denite file/rec file_mru<CR>
nnoremap <C-p>    :<C-u>Denite file/rec file_mru<CR>

nnoremap <Space>d :<C-u>Denite directory_rec<CR>
nnoremap cd :<C-u>Denite directory_rec<CR>

nnoremap <Space>g :<C-u>Denite grep<CR>
nnoremap <C-g>    :<C-u>Denite grep<CR>

nnoremap <Space>: :<C-u>Denite command mapping<CR>
nnoremap <Space>t :<C-u>Denite tag<CR>
" nnoremap <Space>l :<C-u>Denite outline<CR>
nnoremap <Space>b :<C-u>Denite buffer<CR>
nnoremap <Space>r :<C-u>Denite register<CR>
nnoremap <Space>m :<C-u>Denite file_mru<CR>
" nnoremap <Space>y :<C-u>Denite history/yank<CR>
nnoremap <Space>f :<C-u>Denite line<CR>

" command! DeniteOpen :Denite file/rec
" command! DeniteGrep :Denite grep
" command! DeniteOutline :Denite outline
" command! DeniteTag :Denite tag
" command! DeniteBuffer :Denite buffer
" command! DeniteRegister :Denite register
" command! DeniteDein :Denite dein

" Grep
if executable('rg')
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading', '--smart-case'])
elseif executable('ag')
  call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

" Move at insert mode
call denite#custom#map('insert', '<C-j>',
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>',
      \ '<denite:move_to_previous_line>', 'noremap')
