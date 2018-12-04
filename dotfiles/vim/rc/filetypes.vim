" filetype追加
augroup vimrc-filetypes
    autocmd!

    " Markdown
    autocmd BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

    " Ruby
    autocmd BufRead,BufNewFile Gemfile set filetype=ruby
    autocmd BufRead,BufNewFile Rakefile set filetype=ruby
    autocmd BufRead,BufNewFile Fastfile set filetype=ruby
    autocmd BufRead,BufNewFile Podfile set filetype=ruby
    autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

    " Python
    autocmd BufRead,BufNewFile SConstruct set filetype=python
    autocmd BufRead,BufNewFile SConscript set filetype=python

    " Kotlin
    autocmd BufRead,BufNewFile *.kt set filetype=kotlin
    autocmd BufRead,BufNewFile *.kts set filetype=kotlin

    " Typescript
    autocmd BufRead,BufNewFile *.ts set filetype=typescript

    " PowerShell
    autocmd BufRead,BufNewFile *.ps1 set filetype=ps1
    
    " blockdiag
    autocmd BufRead,BufNewFile *.diag set filetype=blockdiag
    autocmd BufRead,BufNewFile *.blockdiag set filetype=blockdiag

    " PlantUML
    autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml set filetype=plantuml

    " riot.js tag file
    autocmd BufRead,BufNewFile *.tag setlocal ft=javascript

augroup END

