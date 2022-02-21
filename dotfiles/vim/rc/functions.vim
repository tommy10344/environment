" path にパスを追加する
function! Add_path(path) abort
    let full_path = escape(expand(a:path), ' ')
    if isdirectory(full_path)
        execute 'set path+=' . full_path
    endif
endfunction

" $PATH にパスを追加する
function! Add_PATH(path) abort
    let full_path = escape(expand(a:path), ' ')
    if isdirectory(full_path)
        let $PATH = full_path . ':' . $PATH
    endif
endfunction

" Split window and launch terminal under the current window
function! SplitTerminal() abort
    split
    wincmd j
    terminal
    startinsert
endfunction

" Split window and launch terminal at the right side of the current window
function! VSplitTerminal() abort
    vsplit
    wincmd l
    terminal
    startinsert
endfunction
