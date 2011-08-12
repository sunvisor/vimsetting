set nocompatible

"********** Vundle Setting ******************** 

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
Bundle "Shougo/neocomplcache"
Bundle "scrooloose/nerdtree"
Bundle "vim-scripts/YankRing.vim"
Bundle "vim-scripts/surround.vim"
Bundle "thinca/vim-ref"
Bundle "vim-scripts/qtmplsel.vim"
Bundle "joestelmach/javaScriptLint.vim"
Bundle "peterhost/vim-markdown-preview"
Bundle "majutsushi/tagbar"

filetype plugin indent on     " required! 

"********** End of Vundle Setting ******************** 

colorscheme desert
syntax on
set formatoptions+=Mm
set showcmd
set ruler
set nobackup

" ヤンクの時にクリップボードにもセットする
set clipboard+=unnamed

" NeoCompleteCache関連
let g:neocomplcache_enable_at_startup = 1
command! -nargs=* Es NeoComplCacheEditSnippets
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

" NERDTree関連
let g:NERDTreeWinSize = 44

" キーバインド
imap <C-l> <Esc>
imap <C-j> <Down>
imap <C-k> <Up>
map <C-d> "9yiw:Ref alc <C-r>9<Cr>
map <C-a> f<i<Cr><Esc>%f>a<Cr><Esc>
nmap <F2> :NERDTree devsites<CR>:TagbarOpen<CR>
nmap <S-F2> :NERDTreeToggle<CR>:TagbarToggle<CR>

" ファイルタイプ設定
autocmd BufNewFile,BufRead *.md,*.markdown,*.mdown,*.mkd,*.mkdn,README.md setfiletype markdown

