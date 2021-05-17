source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/snippets/bindings.vim
source $HOME/.config/nvim/commands/auto.vim
source $HOME/.config/nvim/commands/functions.vim



augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

" -- Functions and Commands
" :W sudo saves the file (no permission denied)
command W w !sudo tee % > /dev/null
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" Custom Functions
function! TogglePaste()
    if(&paste == 0)
        set paste
        echo "Paste Mode Enabled"
    else
        set nopaste
        echo "Paste Mode Disabled"
    endif
endfunction
map <leader>pa :call TogglePaste()<cr>

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" LSP Stuff
Plug 'nvim-lua/popup.nvim'
Plug 'alexaandru/nvim-lspupdate'
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/lsp-trouble.nvim'
Plug 'folke/lsp-colors.nvim'
nnoremap <Leader>sd :LspTroubleToggle<CR><C-W><C-K><C-W><C-L>

Plug 'pechorin/any-jump.vim'
nnoremap <leader>aj :AnyJump<CR>

Plug 'glepnir/lspsaga.nvim'
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> sh <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'kosayoda/nvim-lightbulb'
Plug 'simrat39/symbols-outline.nvim'

Plug 'nvim-lua/plenary.nvim'
"Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
nnoremap <silent> <Leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>dc :lua require'dap'.continue()<CR>
nnoremap <silent> <Leader>di :lua require'dap'.step_into()<CR>
nnoremap <silent> <Leader>ds :lua require'dap'.step_over()<CR>
nnoremap <silent> <Leader>do :lua require'dap'.repl.toggle()<CR>
nnoremap <silent> <leader>dt :lua require('dap-python').test_method()<CR>

Plug 'keith/swift.vim'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
nnoremap <silent> <leader>dg :DogeGenerate<CR>

" Fuzzy Find
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'MattesGroeger/vim-bookmarks'
nmap <C-F> :Telescope buffers theme=get_dropdown<CR>
nnoremap <Leader>pp :Telescope find_files theme=get_dropdown<CR>
nnoremap <Leader>fh :Telescope command_history theme=get_dropdown<CR>
nnoremap <Leader>fl :Telescope live_grep<CR>
nnoremap <Leader>ft :Telescope filetypes theme=get_dropdown<CR>
nnoremap <Leader>fc :Telescope commands theme=get_dropdown<CR>
nnoremap <Leader>fd :Telescope lsp_document_diagnostics theme=get_dropdown<CR>
nnoremap <Leader>ff :Telescope current_buffer_fuzzy_find<CR>
nnoremap <Leader>fu :Telescope grep_string<CR>
nnoremap <Leader>fo :Telescope oldfiles theme=get_dropdown<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

Plug 'kyazdani42/nvim-web-devicons'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

Plug 'kyazdani42/nvim-tree.lua'
nnoremap <Leader>tr :NvimTreeToggle<CR><C-W><C-L>
nnoremap <Leader>tc :NvimTreeToggle<CR> :vertical resize +30<CR><C-W><C-L>

" NvimTree with LSPToggle
nnoremap <silent> <Leader>ido :NvimTreeOpen<CR>:LspTroubleOpen<CR><C-W><C-K><C-W><C-L>
nnoremap <silent> <Leader>ido :NvimTreeOpen<CR>:LspTroubleOpen<CR><C-W><C-K><C-W><C-L>
nnoremap <silent> <Leader>idc :NvimTreeClose<CR>:LspTroubleClose<CR>
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_width_allow_resize  = 1

Plug 'AndrewRadev/splitjoin.vim'
" Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
" let g:indent_blankline_show_current_context = v:true
" let g:indentLine_fileTypeExclude = ['dashboard', '*.vim', 'term']
Plug 'godlygeek/tabular'
nnoremap <Leader>tf :Tabularize /\|<CR>

Plug 'plasticboy/vim-markdown'
" Registers
Plug 'gennaro-tedesco/nvim-peekup'
" Plug 'tversteeg/registers.nvim'

" Git
Plug 'TimUntersberger/neogit'
" Sweet Sweet FuGITive
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
nmap <leader>gs :Neogit<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>ga :Git add --all<CR>
nmap <leader>gm :MerginalToggle <CR>
nnoremap <Leader>gb :Telescope git_branches<CR>
nmap <leader>gp :Git -c push.default=current push<CR>

Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>

Plug 'jiangmiao/auto-pairs'

Plug 'lervag/vimtex'
let g:tex_flavor = 'latex'
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}

Plug 'folke/which-key.nvim'

Plug 'majutsushi/tagbar'
nnoremap <Leader>ta :TagbarToggle<CR>
nnoremap <Leader>tj :TagbarOpen fj<CR>

"TagBar Remap
map <C-t> :TagbarToggle<CR>
let g:tagbar_compact = 1
Plug 'szw/vim-maximizer'
nnoremap <Leader>oo :MaximizerToggle<CR>

Plug 'wesQ3/vim-windowswap'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ludovicchabant/vim-gutentags'
command! MakeTags !ctags -R .

Plug 'andweeb/presence.nvim'

Plug 'szw/vim-g'
xnoremap <leader>lo :Google <CR>

Plug 'kevinhwang91/nvim-hlslens'
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>

Plug 'b3nj5m1n/kommentary'

" The Pope
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired' " Add extra operators to [
Plug 'tpope/vim-tbone' " tmux bidnings for vim

Plug 'dag/vim-fish'
Plug 'vimlab/split-term.vim'
Plug 'akinsho/nvim-toggleterm.lua'
nmap <Leader>to :ToggleTerm<CR><C-\><C-n><C-W><C-K><C-W><C-L>
Plug 'numToStr/FTerm.nvim'

Plug 'glepnir/dashboard-nvim'
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f o',
\ 'find_file'          : 'SPC p p',
\ 'new_file'           : 'SPC c n',
\ 'change_colorscheme' : 'SPC c c',
\ 'find_word'          : 'SPC f l',
\ 'book_marks'         : 'SPC b m',
\ }
nnoremap <silent> <Leader>rc :tabnew ~/.config/nvim/init.vim<CR>
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>cc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
nnoremap <silent> <Leader>bm :Telescope vim_bookmarks all<CR>
nnoremap <silent> <Leader>bc :Telescope vim_bookmarks current_file<CR>

Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}
nmap <Leader>md :Glow<CR>

Plug 'romgrk/barbar.nvim'
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprev<CR>
Plug 'vim-scripts/Tabmerge' " merge tabs into panes
nnoremap <Leader>tm :Tabmerge right<CR>

Plug 'justinmk/vim-sneak' " jump to 2 char match (sxy)
Plug 'unblevable/quick-scope'
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" Line Bar
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'sbdchd/neoformat'

" Colorschemes
Plug 'tjdevries/colorbuddy.vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'folke/tokyonight.nvim'
let g:tokyonight_style = 'night'
let g:tokyonight_sidebars = ["tagbar", "toggleterm"]
Plug 'marko-cerovac/material.nvim'
let g:material_style = 'palenight'
let g:material_flat_ui = 1
Plug 'tiagovla/tokyodark.nvim'
Plug 'savq/melange'
Plug 'yonlu/omni.vim'
Plug 'gruvbox-community/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
Plug 'gerardbm/vim-atomic'
Plug '1612492/github.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'Th3Whit3Wolf/onebuddy'
Plug 'flazz/vim-colorschemes'
Plug 'svermeulen/vim-yoink'
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
call plug#end()

" SET COLORSCHEME
luafile ~/.config/nvim/eviline.lua
lua require('colorbuddy').colorscheme('tokyonight')
" colorscheme material

" General Leader
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>tt :tabnew<CR>
nnoremap <Leader>> :vertical resize +15<CR>
nnoremap <Leader>< :vertical resize -15<CR>
nnoremap <Leader>vs :vs<CR>
nnoremap <Leader>sp :sp<CR>
nnoremap <Leader>vt :VTerm<CR>
nnoremap <Leader>jj :lua require("FTerm").toggle()<CR>
tnoremap JJ <C-\><C-n>:lua require("FTerm").toggle()<CR>

nnoremap <Leader>te :term<CR>
nnoremap <Leader>tp :Term<CR>

" Saving and exiting commands
nnoremap <Leader>wn :write<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>qn :q<CR>
nnoremap <Leader>qq :qa!<CR>
nnoremap <silent><leader>qa :SessionSave<CR>:qa!<CR>
nnoremap <Leader>wq :wq<CR>


" Neovim 0.5.0 configurations nightly
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Avoid showing message extra message when using completion
set shortmess+=c
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1

lua << EOF

local nvim_lsp = require('lspconfig')


local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
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
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

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
local servers = {"pyright", "pyls", "tsserver" }


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { capabilities = capabilities, on_attach = on_attach }
end

-- LUA
local system_name = "Linux" -- (Linux, macOS, or Windows)
local sumneko_root_path = '/home/ethan/.linters/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require('lspconfig').sumneko_lua.setup({
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  -- An example of settings for an LSP server.
  --    For more options, see nvim-lspconfig
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    }
  },

  on_attach = on_attach
})

-- C Lang
nvim_lsp.clangd.setup({
    on_attach=on_attach,
    cmd = { "clangd" },
    filetypes = { "c" },
})

-- RUST
nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- SWIFT
local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

if not configs.sourcekit_lsp then
    configs.sourcekit_lsp = {
        default_config = {
            cmd = {'/home/ethan/swift-5.3.3-RELEASE-ubuntu20.04/usr/bin/sourcekit-lsp'};
            filetypes = {'swift'};
            settings = {};
            root_dir = function(fname)
              return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
            end;
        };
    }
end

lspconfig.sourcekit_lsp.setup{on_attach = on_attach}
EOF

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
require('telescope').load_extension('vim_bookmarks')

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
  debug = true;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 500;
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
highlight link CompeDocumentation NormalFloat

lua << EOF
require('lspkind').init({with_text = true})
EOF

lua << EOF
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/usr/bin/python3';
  args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return '/usr/bin/python3'
    end;
  },
}
EOF

lua require('dap-python').setup('/usr/bin/python3')
lua require('dap-python').test_runner = 'pytest'

lua << EOF
require("trouble").setup {}
EOF

lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga({
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    border_style = "double"
})
EOF

lua << EOF
require('gitsigns').setup()
EOF

lua << EOF
local neogit = require('neogit')
neogit.setup {}
EOF

lua << EOF
local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require('symbols-outline').setup(opts)
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

lua << EOF
require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
},
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
}
EOF

lua << EOF
require'lsp_signature'.on_attach()
EOF

lua << EOF
require'FTerm'.setup({
    dimensions  = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5
    },
    border = 'single' -- or 'double'
})
EOF

lua <<EOF
vim.lsp.handlers['textDocument/hover'] = function(_, method, result)
  vim.lsp.util.focusable_float(method, function()
    if not (result and result.contents) then
      -- return { 'No information available' }
      return
    end
    local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      -- return { 'No information available' }
      return
    end
    local bufnr, winnr = vim.lsp.util.fancy_floating_markdown(markdown_lines, {
      pad_left = 1; pad_right = 1;
    })
    vim.lsp.util.close_preview_autocmd({"CursorMoved", "BufHidden"}, winnr)
    return bufnr, winnr
  end)
end
EOF


" RUN PROJECT COMMANDS
" RUST
autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd FileType rust nnoremap <Leader>ru :lua require("FTerm").open()<CR>clear<CR>cargo run --quiet<CR>
autocmd FileType rust nnoremap <Leader>li :TermExec cmd='watchexec --clear -e rs "clear ; cargo run"'<CR>


" PYTHON
autocmd FileType python nnoremap <Leader>ru :lua require("FTerm").open()<CR>clear<CR>pytest -W ignore::DeprecationWarning<CR>
autocmd FileType python nnoremap <Leader>li :TermExec cmd='watchexec --clear -e py "clear ; pytest -W ignore::DeprecationWarning"'<CR>
