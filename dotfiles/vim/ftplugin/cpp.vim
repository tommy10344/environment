let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

if executable("/usr/local/bin/clang")
    let g:marching_clang_command = "/usr/local/bin/clang"
elseif executable("/usr/bin/clang")
    let g:marching_clang_command = "/usr/bin/clang"
elseif executable("/bin/clang")
    let g:marching_clang_command = "/bin/clang"
endif

let g:marching_enable_neocomplete = 1
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
set updatetime=200

" インクルードパス一覧
let g:vimrc_include_paths = []
function! g:VimrcAddIncludePath(path) abort
    let full_path = escape(expand(a:path), ' ')

    " pathに追加
    call s:add_path(full_path)

    let found = 0
    for i in g:vimrc_include_paths
        if i == full_path
            let found = 1
        endif
    endfor
    if ! found
        call add(g:vimrc_include_paths, full_path)

        " -Iオプションを作成し、watchdogs_checkerのコマンド引数に追加
        let cmdopt = ''
        for i in g:vimrc_include_paths
            let cmdopt = cmdopt . '-I' . i . ' '
        endfor
        call s:put_quickrun_config("watchdogs_checker/clang",   {"cmdopt" : cmdopt})
        call s:put_quickrun_config("watchdogs_checker/clang++", {"cmdopt" : cmdopt})
        call s:put_quickrun_config("watchdogs_checker/gcc",     {"cmdopt" : cmdopt})
        call s:put_quickrun_config("watchdogs_checker/g++",     {"cmdopt" : cmdopt})
        call watchdogs#setup(g:quickrun_config)
    endif
endfunction



setlocal matchpairs+=<:>

" カレントディレクトリ以下の 'include' ディレクトリを再帰的に探索し、
" インクルードパスとして追加する (depth=5)
let include_dirs = finddir('include', './**5', -1)
let include_search_option = ''
for include_dir in include_dirs
    call g:VimrcAddIncludePath(getcwd() . '/' . include_dir)
endfor
