scriptencoding utf-8

if has('nvim')
    " Python2
    if filereadable('/opt/homebrew/bin/python2')
        let g:python_host_prog = '/opt/homebrew/bin/python2'
    elseif filereadable('/usr/local/bin/python2')
        let g:python_host_prog = '/usr/local/bin/python2'
    elseif filereadable('/usr/bin/python2')
        let g:python_host_prog = '/usr/bin/python2'
    endif

    " Python3
    if filereadable('/opt/homebrew/bin/python3')
        let g:python3_host_prog = '/opt/homebrew/bin/python3'
    elseif filereadable('/usr/local/opt/python@3/bin/python3')
        let g:python3_host_prog = '/usr/local/opt/python@3/bin/python3'
    endif
endif
