if has('mac')
    function! s:ShowInFinder()
        if filereadable(expand("%"))
            let l:command = "open -R " . shellescape("%")
        elseif getftype(expand("%:p:h")) == "dir"
            let l:command = "open " . shellescape("%") . ":p:h"
        else
            let l:command = "open ."
        endif

        execute ":silent! !" . l:command

        redraw!
    endfunction

    command! ShowInFinder call <SID>ShowInFinder()
endif
