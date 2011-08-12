set expandtab
set formatoptions+=r
set formatoptions+=o
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
compiler tidy
setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ \"%\"

""
" コメントアウト
let g:surround_{char2nr('c')} = "<!-- \r -->"
