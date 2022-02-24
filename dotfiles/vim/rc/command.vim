""""""""""""""""""""""""""""""""""""""""
" 汎用コマンド
"

command! CdCurrent lcd %:p:h
command! ConfigEdit :e $MYVIMRC
command! ConfigReload :source $MYVIMRC
command! Hex :%!xxd -g 1
command! HexReverse :%!xxd -r
command! UpdatePlugin :PlugUpdate
