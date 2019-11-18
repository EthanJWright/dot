" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'majutsushi/tagbar' " Browse tags of file
Plug 'rafi/awesome-vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'

" FZF Commands 
Plug '/usr/local/opt/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'morhetz/gruvbox'

Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

" The Pope's Plugs
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()



set splitbelow " split all windows below, including the terminal which is where I always want it

" command V :vert term
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" Terminal Commands

" Fix navigation in terminal 
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

command! MakeTags !ctags -R .

inoremap jk <ESC>

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

set relativenumber
set number

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

" colorscheme gruvbox
let g:two_firewatch_italics=1"
set background=dark
set termguicolors
" colorscheme one
colorscheme onedark


" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" My Things 


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


inoremap ;; <Esc>/<..><Enter>"_c4l
syntax on
" :W sudo saves the file (no permission denied)

" Remap : to ; for ease of use
nnoremap ; :
command W w !sudo tee % > /dev/null


set showmatch
set hlsearch 


set smartindent
"Set tab spacing to 4 
set tabstop=4
set softtabstop=4

" * Text Formatting -- Specific File Formats

" Enable filetype plugins
filetype plugin on
filetype indent on


" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd


" don't make it look like there are line breaks where there aren't:
set nowrap


" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::


" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent


" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro


" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" * Search & Replace

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" page down with <Space> (like in `Lynx', `Mutt', `Pine', `Netscape Navigator',
" `SLRN', `Less', and `More'); page up with - (like in `Lynx', `Mutt', `Pine'),
" or <BkSpc> (like in `Netscape Navigator'):
"noremap <Space> <PageDown>
noremap <BS> <PageUp>

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>

" * Keystrokes -- Formatting

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vmap <Tab> <C-T>

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$


" have \tl ("toggle list") toggle list on/off and report the change:
nnoremap \tl :set invlist list?<CR>
nmap <F2> \tl

" * Keystrokes -- Insert Mode

syntax on


" Add custom filling in of printing, classes, functions, etc. based on the language
"
" General
inoremap ;k "<..>" : <..>,<esc>0f>ca<
inoremap ;M :vnew \| 0read ! 


" Node & Javascript
autocmd BufNewFile,BufRead * if match(getline(1),"node") >= 0 | set filetype=javascript | endif
autocmd FileType javascript inoremap ;f function <..>(<..>) {<Enter><..><Enter>}<esc>kkt>ca<
autocmd FileType javascript inoremap ;l for ( var i = 0; i < <..>; i++ ) {<Enter><..><Enter>}<esc>kkt>ca<
autocmd FileType javascript inoremap ;p console.log(`<..>`);<esc>0/<..><Enter>ca<
autocmd FileType javascript inoremap ;t <esc>A.then( (<..>) => {<Enter><..><Enter>});<esc>kkt>ca<
autocmd FileType javascript inoremap ;c <esc>$xA.catch( (err) => {<Enter><..><Enter>});<esc>kt>ca<
autocmd FileType javascript inoremap ;r <..> = require("<..>");<esc>0f>ca<
autocmd FileType javascript inoremap ;R <..> = require("<..>"),<esc>0f>ca<
autocmd FileType javascript inoremap ;J JSON.stringify(<..>, null, 2)<esc>FJf>ca<

" PYTHON
autocmd FileType python inoremap ;c class <..>:<Enter>def __init__(self, <..>):<Enter>self.<..> = <..><esc>ggi
autocmd FileType python inoremap ;f def <..>(<..>):<Enter><..><esc>0kt>ca<
autocmd FileType python inoremap ;l for i in range(0, <..>):<Enter><..><esc>kt>ca<
autocmd FileType python inoremap ;p print(f'<..>')<esc>0t>ca<
autocmd FileType python inoremap ;m def main(argv):<Enter><..><Enter>pass<Enter><esc>I<Enter><Enter>if __name__ == "__main__":<Enter>main(sys.argv)<esc>5k0f>ca<


" C and Cpp
autocmd BufNewFile,BufRead * if match(getline(1),"*.hpp") >= 0 | set filetype=cpp | endif
autocmd BufNewFile,BufRead * if match(getline(1),"*.h") >= 0 | set filetype=c | endif
autocmd FileType c,cpp inoremap ;c #ifndef _<..>_H_<Enter>#define _<..>_H_<Enter><Enter>using namespace std;<Enter><Enter>class <..>:<Enter>{<Enter>public:<Enter><..>()<Enter>private:<Enter>};<Enter>#endif<esc>ggi
autocmd FileType c,cpp inoremap ;f  <..> <..>(<..>)<Enter>{<Enter><..><Enter>}<esc>kkkcw
autocmd FileType c,cpp inoremap ;m  int main(int argc, char *argv[])<Enter>{<Enter><..><Enter>}<esc>kwcw
autocmd FileType c,cpp inoremap ;l  for ( int i = 0; i < <..>; i++ )<Enter>{<Enter><..><Enter>}<esc>kkkt>ca<
autocmd FileType c,cpp inoremap ;i  #include ""<esc>i
autocmd FileType c,cpp inoremap ;I  #include <><esc>i
autocmd FileType cpp inoremap ;p  cout << "<..>" << endl;<esc>0t>ca<
autocmd FileType c inoremap ;p  printf("<..>\n");<esc>0t>ca<


" Skeleton Builders
autocmd FileType c inoremap ;t  <esc>:-1read $HOME/.vim/skeletons/.skeleton.c<CR>gg/<..><Enter>ca<
autocmd FileType cpp inoremap ;t  <esc>:-1read $HOME/.vim/skeletons/.skeleton.cpp<CR>gg/<..><Enter>ca<
autocmd FileType cpp inoremap ;ht  <esc>:-1read $HOME/.vim/skeletons/.skeleton.hpp<CR>gg/<..><Enter>ca<
autocmd FileType html inoremap ;t  <esc>:-1read $HOME/.vim/skeletons/.skeleton.html<CR>gg/<..><Enter>ca<






" Reload from place last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" For resizing splits "
fun! PANEHOR() 
    wincmd t
    wincmd H
endfun

fun! PANEVERT() 
    wincmd t
    wincmd K
endfun

" nnoremap <C-y> :call PANEHOR()<CR>
" nnoremap <C-n> :call PANEVERT()<CR>

function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! InsertTabWrapper(direction)
  let char_before = col('.') - 1
  if !char_before || getline('.')[char_before - 1] !~ '\k'
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfu
inoremap <tab> <c-r>=InsertTabWrapper("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper("backward")<cr>


" FZF Remapping
nmap <C-P> :Files<CR>z.

" FZF completion


" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)


" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
