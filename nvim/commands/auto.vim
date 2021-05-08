" Markdown
autocmd BufNewFile,BufRead *.md set spell
autocmd BufNewFile,BufRead *.md set wrap
autocmd BufNewFile,BufRead *.md set linebreak
autocmd BufNewFile,BufRead *.md set nolist  " list disables linebreak

" auto source when writing vimrc
au! BufWritePost $MYVIMRC source %

" Reload from place last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
