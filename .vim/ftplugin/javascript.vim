" Only do this when not done yet for this buffer
if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1
" let javaScript_fold = 1
" setlocal dictionary=~/.vim/dict/javascript.dict
" set tags=~/Dropbox/Sync/dotted/tags-extjs-3.3.0,~/Dropbox/Sync/dotted/tags-sencha-touch-1.0.1
set expandtab
set formatoptions+=r
set formatoptions+=o
set tabstop=4
set softtabstop=4
set shiftwidth=4
" compiler javascriptlint
set tags=~/.vim/tags/extjs-tags,~/.vim/tags/sencha-touch-tags
set number

""
" コメントアウト
let g:surround_{char2nr('c')} = "/* \r */"
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,c :s/^\/\///<CR>:nohlsearch<CR>
nmap ,/ V,/
nmap ,c V,c

" javascript fold(Anonymous function)
" syntax match   javaScriptAnonymouseFunction       /\<function\>/ nextgroup=javaScriptAnonymouseFuncName skipwhite                
" syntax region  javaScriptAnonymouseFuncName       contained matchgroup=javaScriptAnonymouseFuncName start=/(/ end=/)/ contains=javaScriptLineComment,javaScriptComment nextgroup=javaScriptFuncBlock skipwhite skipempty
" syntax region  javaScriptAnonymouseFuncBlock      contained matchgroup=javaScriptAnonymouseFuncBlock start="{" end="}" contains=@javaScriptAll,javaScriptParensErrA,javaScriptParensErrB,javaScriptParen,javaScriptBracket,javaScriptBlock fold
" syntax keyword javaScriptAnonymouseFunction function

" Neocomplcache関連
smap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

nmap ,d :<C-u>call WriteJSDocComment()<CR>

" WriteJSDocComment.vim
" write JSDoc comment
" Version: 0.2
" Author: Hideaki Tanabe <tanablog@gmail.com>
"
" Caution: this script need perl interface (compile with +perlinterp)
" setting: 
"  1.
"   install in ~/.vim/ftplugin/javascript/
"  2.
"   assign keymap at .vimrc for example
"   au FileType javascript nnoremap <buffer> <C-c>  :<C-u>call WriteJSDocComment()<CR>

function! WriteJSDocComment()
if has('perl')
perl << EOF
  # check the function has return parameter
  sub has_return {
    my $row = shift;
    my $brace_count = 1;
    my $i = 0;
    my $limit = 200;
    $row++;
    while (($brace_count > 0) || ($limit < 0)) {
      if ($row > $curbuf->Count()) {
        return false;
      }
      my $line = $curbuf->Get($row);
      $brace_count++ if $line =~ /{/g;
      $brace_count-- if $line =~ /}/g;
      if ($brace_count == 1) {
        return true if $line =~ /return/g;
      }
      $limit--;
      $row++;
    }
    return false;
  }

  # get the name of function
  sub get_function_name {
    $line = shift;
    if ($line =~ /(\w+)\s*(:|=)\s*function/g) {
      return $1;
    } elsif ($line =~ /function \s*(\w+)\s*\(/g) {
      return $1;
    }
    return '';
  }

  my @pos = $curwin->Cursor();
  my $row = @pos[0];
  my $col = @pos[1];
  my $line = $curbuf->Get($row);
  my @params = $line =~ /\((.*)\)/g;
  my $function_name = get_function_name($line);

  @params = split(/\s*,\s*/, @params[0]);
  @params = map {' * @param ' . $_ . " "} @params;
  unshift(@params, (' * @name ' . $function_name, ' * @function'));
  if (has_return($row) eq 'true') {
    push(@params, ' * @return ');
  } 
  my @comments = map {" " x $col . $_} ('/**', ' * ', @params, ' */');
  $curbuf->Append(@pos[0] - 1, @comments);
EOF
endif
endfunction
