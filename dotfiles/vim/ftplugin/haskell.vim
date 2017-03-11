" vim2hs
let g:haskell_conceal = 0

" neco-ghc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" nnoremap <C-c> :<C-u>GhcModCheck<CR>
nnoremap <C-i> :<C-u>GhcModInfo<CR>
nnoremap <C-t> :<C-u>GhcModType<CR>
nnoremap <C-g> :<C-u>GhcModTypeClear<CR>
command! Hoogle :Unite hoogle
command! HaskellImport :Unite haskellimport

" cabal run / cabal build をQuickRunから呼び出す
" command! CabalBuild :QuickRun cabal/build
" command! CabalRun :QuickRun cabal/run
" call s:put_quickrun_config("cabal/build", {
" \       "exec" : "%c %o",
" \       "command" : "cabal",
" \       "cmdopt" : "build",
" \       "outputter" : "error:buffer:quickfix",
" \       "runner" : "vimproc",
" \})
" call s:put_quickrun_config("cabal/run", {
" \       "exec" : "%c %o",
" \       "command" : "cabal",
" \       "cmdopt" : "run",
" \       "outputter" : "error:buffer:quickfix",
" \       "runner" : "vimproc",
" \})

" Haskell syntax checker
" call s:put_quickrun_config("haskell/watchdogs_checker", {
" \   "type"
" \       : executable("ghc-mod")     ? "watchdogs_checker/ghc-mod"
" \       : executable("hlint")       ? "watchdogs_checker/hlint"
" \       : executable("hdevtools")   ? "watchdogs_checker/hdevtools"
" \       : ""
" \   })
" call watchdogs#setup(g:quickrun_config)

" call s:make_to_cabal_build()
" call s:make_to_stack_build()

" haskellmode-vim
" compiler ghc
" let g:haddock_browser = '/Applications/Safari.app'

" " :make で呼び出すコマンドを cabal build に設定する
" function! s:make_to_cabal_build()
"   if glob("*.cabal") != ''
"     setlocal makeprg=cabal\ build
"   endif
" endfunction
" 
" " :make で呼び出すコマンドを stack build に設定する
" function! s:make_to_stack_build()
"   if glob("stack.yaml") != ''
"     setlocal makeprg=stack\ build
"   endif
" endfunction

if glob('stack.yaml') != ''
    setlocal makeprg=stack\ build
endif
