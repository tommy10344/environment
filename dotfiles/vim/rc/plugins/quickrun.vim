""""""""""""""""""""""""""""""""""""""""
" vim-quickrun
"
" command! Run QuickRun
" command! Open QuickRun open

" g:quickrun_configに設定を追加する
function! PutQuickrunConfig(type, config) abort
    if !exists("g:quickrun_config")
        let g:quickrun_config = {}
    endif
    let g:quickrun_config[a:type] = a:config
endfunction

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
""""""""""""""""""""""""""""""""""""""""
