""""""""""""""""""""""""""""""""""""""""
" 汎用コマンド
"

command! CdCurrent lcd %:p:h
command! Rc :e ~/.vimrc
command! Hex :%!xxd -g 1
command! HexReverse :%!xxd -r
command! UpdatePlugin :PlugUpdate
