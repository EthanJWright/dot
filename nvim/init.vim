let g:which_key_map =  {}
syntax on

set guicursor=
set nocompatible
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'kyazdani42/nvim-tree.lua'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default

Plug 'AndrewRadev/splitjoin.vim'
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
let g:indent_blankline_show_current_context = v:true
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-peekaboo'
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-jdaddy'
Plug 'idanarye/vim-merginal'
Plug 'mbbill/undotree'

Plug 'sheerun/vim-polyglot'
" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
let g:tex_flavor = 'latex'
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
"
" On-demand lazy load
Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'majutsushi/tagbar'
"TagBar Remap
map <C-t> :TagbarToggle<CR>
command T TagbarOpen<Space>j
let g:tagbar_compact = 1
Plug 'vim-scripts/ZoomWin'
Plug 'junegunn/goyo.vim'
let g:goyo_width=120
function! s:goyo_enter()
    :set number
    :set relativenumber
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()

Plug 'wesQ3/vim-windowswap'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'mhinz/vim-signify'
Plug 'ludovicchabant/vim-gutentags'
Plug 'szw/vim-g'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'vimlab/split-term.vim'
" JK is escape in split terminal
tnoremap JK <C-\><C-n>

Plug 'mhinz/vim-startify'
let g:startify_change_to_dir = 0
let g:startify_bookmarks = [
    \ { 'i' : '~/.config/nvim/init.vim' },
    \ ]
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_custom_header = []
let g:startify_custom_indices = ['h', 'j', 'k', 'l', 'H', 'J', 'K', 'L', 'a', 's', 'd', 'f', 'A', 'S', 'D', 'F']
" VIM session handling: :S sessionname to save your current session
" ( doesn't save files ) | from outside of vim : s sessionname to open session
function MakeSession(session)
    execute "SSave! ". fnameescape(a:session)
    execute "qa"
endfunction
command! -nargs=1 S call MakeSession(<f-args>)

Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'vim-scripts/Tabmerge'
Plug 'romgrk/barbar.nvim'

" Commentary Changes
autocmd FileType c setlocal commentstring=//\ %s

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired' " Add extra operators to [

Plug 'tpope/vim-tbone' " tmux bidnings for vim
Plug 'justinmk/vim-sneak' " jump to 2 char match (sxy)
Plug 'unblevable/quick-scope'
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" Line Bar
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}



" Colorschemes
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'chuling/equinusocio-material.vim'
Plug 'yonlu/omni.vim'
Plug 'gruvbox-community/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
Plug 'gerardbm/vim-atomic'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'tjdevries/colorbuddy.vim'
Plug 'Th3Whit3Wolf/onebuddy'
Plug 'flazz/vim-colorschemes'
call plug#end()



" SET COLORSCHEME
luafile ~/.config/nvim/eviline.lua
lua require('colorbuddy').colorscheme('onebuddy')
" colorscheme omni

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25


" FZF mappings
nmap <C-P> :Telescope find_files theme=get_dropdown<CR>
nmap <C-F> :Telescope buffers theme=get_dropdown<CR>




" Saving and exiting commands

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Google Mappings

" Sweet Sweet FuGITive

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace()


set number relativenumber

command! MakeTags !ctags -R .

" // to search for currently selected text
vnoremap // y/<C-R>"<CR>"

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

" King of all remaps
ino jk <esc>

" Vim like pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap - :exe "resize " . (winheight(0) * 2/3)<CR>


inoremap ;; <Esc>/<..><Enter>"_c4l

syntax on
set t_Co=256


" first clear any existing autocommands:
autocmd!
" Set Numbers
set nu
set cursorline
set wrap
set ttyfast

set nofoldenable
set foldmethod=indent
set foldlevel=2
set foldclose=all

set smartindent
"Set tab spacing to 4
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent

"enable syntax processing
syntax enable

set showmatch
set hlsearch

" :W sudo saves the file (no permission denied)
command W w !sudo tee % > /dev/null

" Enable filetype plugins
filetype plugin on
filetype indent on

"Always show current position
set ruler

" Ignore case when searching
set ignorecase


" have fifty lines of command-line (etc) history:
set history=50
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when using list, keep tabs at their full width and display `arrows':
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
" (Character 187 is a right double-chevron, and 183 a mid-dot.)

" don't have files trying to override this .vimrc:
set nomodeline


" * Text Formatting -- General

" don't make it look like there are line breaks where there aren't:
set nowrap

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=79

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::


" * Text Formatting -- Specific File Formats

" enable filetype detection:
"filetype on

" anything at all with a .txt extension as being human-language text [this clobbers the
" `help' filetype, but that doesn't seem to prevent help from working
" properly]:
augroup filetype
  autocmd BufNewFile,BufRead *.txt set filetype=human
  autocmd BufNewFile,BufRead *.tex set filetype=human
augroup END


" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8


" * Search & Replace

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault


" * Keystrokes -- Moving Around

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>


" * Keystrokes -- Formatting
" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$


" * Keystrokes -- Toggles

" Keystrokes to toggle options are defined here.  They are all set to normal
" mode keystrokes beginning \t but some function keys (which won't work in all
" terminals) are also mapped.

nmap <F4> :windo set scb!<CR>

"" have \tf ("toggle format") toggle the automatic insertion of line breaks
"" during typing and report the change:
"nnoremap \tf :if &fo =~ 't' <Bar> set fo-=t <Bar> else <Bar> set fo+=t <Bar>
"  \ endif <Bar> set fo?<CR>
"nmap <F3> \tf
"imap <F3> <C-O>\tf
"
" have \tl ("toggle list") toggle list on/off and report the change:
nnoremap \tl :set invlist list?<CR>
nmap <F2> \tl

" have <L>th ("toggle highlight") toggle highlighting of search matches, and
" report the change:


" * Keystrokes -- Insert Mode

" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
set backspace=eol,start,indent

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
autocmd FileType javascript inoremap ;r const <..> = require("<..>");<esc>0f>ca<
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

" Markdown
autocmd BufNewFile,BufRead * if match(getline(1),"*.md") >= 0 | set filetype=md | endif
autocmd FileType md inoremap ;e  <esc>:-1read $HOME/.vim/skeletons/skeleton.expand.md<CR>gg/<..><Enter>ca<

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

set tags=./tags,tags;$HOME


nnoremap C :grep! "\<<cword>\>" . -r<CR>:botright copen<CR>

" adjust pane layout with toggle C-y
fun! PANEHOR()
    wincmd t
    wincmd H
endfun

fun! PANEVERT()
    wincmd t
    wincmd K
endfun

" Toggle between vertical and horizontal layout
let g:vert = 0
fun! PANETOG()
    if g:vert
        call PANEVERT()
        let g:vert=0
    else
        call PANEHOR()
        let g:vert=1
    endif
endfun
nnoremap <C-y> :call PANETOG()<CR>

fun! ALIGN()
    :execute "normal! mtggvG='tzz"
endfun

fun! FORMAT()
    :execute "normal! mtgggqG'tzz"
endfun

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

command AL :call ALIGN()
command FO :call FORMAT()

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


" Neovim 0.5.0 configurations nightly

lua << EOF
vim.lsp.set_log_level("debug")
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_smart_case = 1


lua << EOF

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wd', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>fi", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>fi", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red gui=italic,underline,bold
      hi LspReferenceText cterm=bold ctermbg=red gui=italic,underline,bold
      hi LspReferenceWrite cterm=bold ctermbg=red gui=italic,underline,bold
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {"pyright", "pyls","rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()


" Telescope Configuration
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')

local M = {}
M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

return M
EOF

lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}
EOF

" Whichkey Keybinds
let g:which_key_map['<CR>'] = [ ':so ~/.config/nvim/init.vim', 'reload vimrc']

let g:which_key_map.f = {
      \ 'name' : '+fuzzy' ,
      \ 'h': [':Telescope command_history theme=get_dropdown', 'previous commands'],
      \ 'f': [':Telescope current_buffer_fuzzy_find', 'string in current buffer'],
      \ 'l': [':Telescope live_grep', 'all repo'],
      \ 't': [':Telescope filetypes theme=get_dropdown', 'set filetype'],
      \ 'c': [':Telescope commands theme=get_dropdown', 'commands'],
      \ 'd': [':Telescope lsp_document_diagnostics theme=get_dropdown', 'lsp diagnostics warnings'],
      \ 'u': [':Telescope grep_string', 'seach under cursor'],
      \ 'o': [':Telescope oldfiles theme=get_dropdown', 'recently open'],
      \ }

let g:which_key_map.t = {
      \ 'name' : '+file' ,
      \ 't' : ['tabnew', 'new tab'],
      \ 'm' : [':Tabmerge right', 'merge tab'],
      \ 'a' : [':TagbarToggle', 'open tagbar'],
      \ 'j' : [':TagbarOpen fj', 'jump to tagbar'],
      \ 'h' : [':set invhls hls?', 'toggle highlight'],
      \ 'e' : [':Term', 'split terminal'],
      \ 'o' : [':term', 'terminal over buffer'],
      \ }

let g:which_key_map.v = {
      \ 'name' : '+vertical',
      \ 's' : [':vs', '<..>'],
      \ 't' : [':VTerm', '<..>'],
      \ }

let g:which_key_map.w = {
      \ 'name' : '+write' ,
      \ 'n' : [':w', 'write current'],
      \ 'a' : [':wa', 'write all'],
      \ 'q' : [':wq', 'write and quit'],
      \ }

let g:which_key_map.q = {
      \ 'name' : '+quit',
      \ 'n' : [':q', 'force'],
      \ 'q' : [':qa!', 'all force'],
      \ 'a' : [':S last', 'current'],
      \ }

let g:which_key_map.p = {
      \ 'name' : '+next',
      \ 'l' : [':lprevious', 'previous in list'],
      \ 'b' : [':bp', 'prevous buffer'],
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer',
      \ 'd' : [':bd', 'delete'],
      \ 'td' : [':bd!', 'force delete'],
      \ }


let g:which_key_map.s = {
      \ 'name' : '+split' ,
      \ 'p' : [':sp', 'pane'],
      \ }


let g:which_key_map.l = {
      \ 'name' : '+lookup' ,
      \ 'o' : [':Google ', 'google'],
      \ 'c' : [':VimtexCompile', 'latex compile'],
      \ }

let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'dd' : [':Git diff', '<..>'],
      \ 'ds' : [':Gdiffsplit', '<..>'],
      \ 's' : [':G', '<..>'],
      \ 'c' : [':Git commit', '<..>'],
      \ 'a' : [':Git add --all', '<..>'],
      \ 'm' : [':MerginalToggle ', '<..>'],
      \ 'b' : [':Telescope git_branches', '<..>'],
      \ 'p' : [':Git -c push.default=current push', '<..>'],
      \ }

let g:which_key_map.c = {
      \ 'name' : '+config' ,
      \ 'v' : [ ':so ~/.config/nvim/init.vim', 'reload vimrc'],
      \ 'c' : [':Telescope find_files ', ''],
      \ }

let g:which_key_map['u'] = [ ':UndotreeToggle', 'undo tree']

let g:which_key_map.r = {
      \ 'name' : '+rename' ,
      \ 'rr' : ['%s/\<<C-r><C-w>\>//g<left><left>', 'under cursor']
      \ }

let g:which_key_map.n = {
      \ 'name' : '+next' ,
      \ 'b' : [':bn', 'buffer'],
      \ 'l' : [':lnext', 'quickfix'],
      \ }

" let g:which_key_map.<..> = {
"       \ 'name' : '+<..>' ,
"       \ }

let g:mapleader = " "
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')


