" -- Navigation Remaps
" King of all remaps
ino jk <esc>

" JK is escape in split terminal
tnoremap JK <C-\><C-n>

" Vim like pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remap j k and to treat 'false' new lines as new line, also keep center
nnoremap j gjzz
nnoremap k gkzz
" Also do it for all the other stuff
nnoremap } }zz
nnoremap { {zz
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-O> <C-O>zz
nnoremap <C-I> <C-I>zz
nnoremap <C-]> <C-]>zz

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$

" -- General Leader Key Mappings

" have <L>th ("toggle highlight") toggle highlighting of search matches, and
" report the change:
nnoremap <Leader>th :nohlsearch<CR>

" rename if LSP doesn't support (in file)
nnoremap <leader>rr :%s/\<<C-r><C-w>\>//g<left><left>
