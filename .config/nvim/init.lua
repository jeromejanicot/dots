require 'modules.packages'
require 'modules.keymaps'
require 'modules.move'
require 'modules.lsp'
require 'modules.harpoon'
require 'modules.nerdtree'
require 'modules.tree-sitter'
require 'modules.fzf'
require 'modules.hydra'
require 'modules.prettier'


local set = vim.opt  -- to set options
local wo = vim.wo
local g = vim.g      -- a table to access global variables
local o = vim.o

--
-- THEME
--

vim.cmd([[
if has('termguicolors')
    set termguicolors
endif

set background=dark

colorscheme everforest 

let g:everforest_background = 'soft'

let g:everforest_better_performance = 1
]])


--
-- SET
--
set.number = true                   -- Show line numbers
set.relativenumber = false          -- set distance from cursor
set.hlsearch = true                 -- Highlight search terms
set.list = true                     -- Show some invisible characters
set.termguicolors = true            -- True color support
set.hidden = true                   -- Enable background buffers
set.scrolloff = 4                   -- Lines of context
set.wrap = false                    -- Disable line wrap
set.sidescrolloff = 8               -- Columns of context
set.errorbells = false
set.signcolumn = 'auto'
--opt.colorcolumn = 80
set.cmdheight = 1

-- Identation
set.tabstop = 4                     -- Number of spaces tabs count for
set.shiftwidth = 4                  -- Size of an indent
set.expandtab = true                -- Use spaces instead of tabs
set.smartindent = true              -- Insert indents automatically
set.expandtab = true
set.shiftround = true               -- Round indent
set.joinspaces = false              -- No double spaces with join

-- Search
set.incsearch = true                -- Show pattern as it is typed
set.ignorecase = true               -- Ignore case
set.smartcase = true                -- Do not ignore case with capitals

-- File management
set.isfname:append('@-@')
set.swapfile = false 
set.backup = false 
set.undofile = true
set.undodir = '.vim/undodir'
set.clipboard = 'unnamedplus'

-- Windows
set.splitright = true               -- Put new windows right of current
set.splitbelow = true               -- Put new windows below current

-- QoL
set.updatetime =50                  -- Avoids delay
--opt.shortmess+=c
set.mouse = 'a'

--opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
--wo.colorcolumn = 80
