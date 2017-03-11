""""""""""""""""""""""""""""""""""""""""
" Denite.nvim
"

nnoremap <Space>: :<C-u>Denite command mapping<CR>
nnoremap <Space>o :<C-u>Denite file_rec file_mru<CR>
nnoremap <Space>d :<C-u>Denite directory_rec<CR>
nnoremap cd :<C-u>Denite directory_rec<CR>
nnoremap <Space>g :<C-u>Denite grep<CR>
nnoremap <Space>t :<C-u>Denite tag<CR>
" nnoremap <Space>l :<C-u>Denite outline<CR>
nnoremap <Space>b :<C-u>Denite buffer<CR>
nnoremap <Space>r :<C-u>Denite register<CR>
nnoremap <Space>m :<C-u>Denite file_mru<CR>
" nnoremap <Space>y :<C-u>Denite history/yank<CR>
nnoremap <Space>f :<C-u>Denite line<CR>

" command! DeniteOpen :Denite file_rec
" command! DeniteGrep :Denite grep
" command! DeniteOutline :Denite outline
" command! DeniteTag :Denite tag
" command! DeniteBuffer :Denite buffer
" command! DeniteRegister :Denite register
" command! DeniteDein :Denite dein

" Grep
if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading', '--smart-case'])
elseif executable('ag')
  call denite#custom#var('file_rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

" Move at insert mode
call denite#custom#map('insert', '<C-j>',
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>',
      \ '<denite:move_to_previous_line>', 'noremap')
