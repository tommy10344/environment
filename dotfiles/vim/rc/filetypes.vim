" filetype追加
augroup vimrc-filetypes
    autocmd!

    " Markdown
    autocmd BufWinEnter,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

    " Ruby
    autocmd BufWinEnter,BufNewFile Gemfile set filetype=ruby
    autocmd BufWinEnter,BufNewFile Rakefile set filetype=ruby
    autocmd BufWinEnter,BufNewFile Fastfile set filetype=ruby
    autocmd BufWinEnter,BufNewFile Podfile set filetype=ruby
    autocmd BufWinEnter,BufNewFile Vagrantfile set filetype=ruby

    " Python
    autocmd BufWinEnter,BufNewFile SConstruct set filetype=python
    autocmd BufWinEnter,BufNewFile SConscript set filetype=python

    " Typescript
    autocmd BufWinEnter,BufNewFile *.ts set filetype=typescript

    " PowerShell
    autocmd BufWinEnter,BufNewFile *.ps1 set filetype=ps1
    
    " blockdiag
    autocmd BufWinEnter,BufNewFile *.diag set filetype=blockdiag
    autocmd BufWinEnter,BufNewFile *.blockdiag set filetype=blockdiag

    " PlantUML
    autocmd BufWinEnter,BufNewFile *.pu,*.uml,*.plantuml set filetype=plantuml

    " riot.js tag file
    autocmd BufWinEnter,BufNewFile *.tag setlocal ft=javascript

augroup END

