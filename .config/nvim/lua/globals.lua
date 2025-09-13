-- Sane defaults for Neovim, sorted by purpose

-- Leader key settings (for key mappings)
vim.g.mapleader = "," -- Set global leader key

-- Editing behavior
-- Controls how text is edited, indented, and formatted
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 2 -- Spaces for a tab
vim.opt.softtabstop = 2 -- Spaces for tab key
vim.opt.shiftwidth = 2 -- Spaces for each indent level
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth
vim.opt.smartindent = true -- Smart auto-indent
vim.opt.smarttab = true -- Respect shiftwidth for tabs
vim.opt.formatoptions = "jcroql" -- Formatting options (join, comments, etc.)
vim.opt.virtualedit = "block" -- Allow cursor in places without text in block mode
vim.opt.textwidth = 80 -- Right margin for text width
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.wrap = true -- Enable line wrapping

-- Search and navigation
-- Settings related to searching and moving through files
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Incremental search
vim.opt.inccommand = "nosplit" -- Show live preview of substitutions
vim.opt.ignorecase = true -- Case-insensitive search
vim.opt.smartcase = true -- Override ignorecase if search contains uppercase
vim.opt.scrolloff = 8 -- Lines to keep above/below cursor
vim.opt.sidescroll = 5 -- Horizontal scroll amount
vim.opt.sidescrolloff = 8 -- Columns to keep left/right of cursor

-- User interface and appearance
-- Controls visual elements, statusline, and cursor behavior
vim.opt.number = true -- Show line numbers
vim.opt.numberwidth = 4 -- Width of line number column
vim.opt.relativenumber = false -- Disable relative line numbers by default
vim.opt.cursorline = true -- Highlight current line
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.termguicolors = true -- Enable true colors
vim.opt.laststatus = 3 -- Global statusline
vim.opt.showmode = false -- Don't show mode (statusline handles this)
vim.opt.showcmd = false -- Don't show partial commands
vim.opt.ruler = false -- Don't show ruler (statusline handles this)
vim.opt.cmdheight = 1 -- Command line height
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.list = false -- Don't show invisible characters by default
vim.opt.listchars = { tab = "» ", trail = "·", eol = "¬", nbsp = "_" } -- Characters for invisible chars
vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.pumheight = 10 -- Max height of popup menu
vim.opt.winblend = 10 -- Window transparency
vim.opt.title = true -- Set terminal title

-- File and buffer management
-- Settings for handling files, buffers, and their persistence
vim.opt.hidden = true -- Allow switching buffers without saving
vim.opt.autoread = true -- Auto-reload files changed outside if not modified
vim.opt.autowrite = false -- Don't auto-write buffers on certain commands
vim.opt.autochdir = false -- Don't change working directory automatically
vim.opt.swapfile = false -- Disable swap files
vim.opt.backup = false -- Disable backup files
vim.opt.undofile = true -- Persistent undo
vim.opt.undolevels = 1000 -- Number of undo levels
vim.opt.fileencoding = "utf-8" -- File encoding
vim.opt.confirm = true -- Prompt to save before destructive actions
vim.opt.viewoptions = { "folds", "cursor" } -- Save fold and cursor state

-- Completion and wildmenu
-- Settings for autocompletion and command-line completion
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Completion options
vim.opt.wildmenu = true -- Enhanced command-line completion
vim.opt.wildmode = "full" -- Command-line completion mode
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "node_modules/*", "__pycache__/*" }) -- Ignore these patterns

-- Folding
-- Settings for code folding
vim.opt.foldenable = true -- Enable folding
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.foldmethod = "manual" -- Manual folding by default
vim.opt.foldcolumn = "1" -- Show fold column

-- Performance optimizations
-- Settings to improve Neovim's performance
vim.opt.lazyredraw = false -- Redraw screen during macros for better visibility
vim.opt.redrawtime = 1500 -- Max time to search for syntax items
vim.opt.re = 0 -- Use new regex engine
vim.opt.synmaxcol = 300 -- Max column to highlight syntax
vim.opt.updatetime = 250 -- Time for CursorHold and swap file writes (ms)

-- Spell checking
-- Settings for spell checking
vim.opt.spell = false -- Disable spell checking by default
vim.opt.spelllang = "en_us" -- Default spell language

-- Clipboard and external integration
-- Settings for clipboard and external tools
vim.opt.clipboard = "unnamedplus" -- Use system clipboard for copy/paste
vim.g.clipboard = {
	name = "unnamedplus",
	copy = {
		["+"] = "wl-copy --trim-newline --foreground --type text/plain",
		["*"] = "wl-copy --trim-newline --foreground --primary --type text/plain",
	},
	paste = {
		["+"] = "wl-paste --no-newline",
		["*"] = "wl-paste --no-newline --primary",
	},
	cache_enabled = 1,
}

vim.opt.grepprg = "rg --vimgrep" -- Use ripgrep for grep
vim.opt.grepformat = "%f:%l:%c:%m" -- Grep format

-- Input and interaction
-- Settings for user input, mouse, and timeouts
vim.opt.mouse = "a" -- Enable mouse in all modes
vim.opt.timeoutlen = 500 -- Time to wait for mapped sequence (ms)
vim.opt.errorbells = false -- Disable error bells
vim.opt.shortmess:append("c") -- Reduce completion messages

-- Window and split management
-- Settings for window behavior and splits
vim.opt.splitbelow = true -- Horizontal splits open below
vim.opt.splitright = true -- Vertical splits open to the right

-- Modeline and file-specific settings
-- Respect file-specific configurations
vim.opt.modeline = true -- Respect modelines in files

-- Provider settings
-- External program integrations
vim.g.python3_host_prog = "/usr/bin/python3" -- Path to Python 3
vim.g.node_host_prog = "/usr/bin/neovim-node-host" -- Path to Node.js host
vim.g.loaded_perl_provider = 0 -- Disable unused providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0

-- Disabled plugins
-- Disable built-in plugins for performance
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Key mappings
-- Basic usability mappings
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlight" })

vim.g.python3_host_prog = "~/.local/bin/python3.13"

-- Autocommands
-- Automatic behaviors for specific events
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*",
	callback = function()
		vim.cmd([[%s/\s\+$//e]]) -- Remove trailing whitespace on save
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 }) -- Highlight yanked text
	end,
})

-- Filetype settings
-- Ensure proper file type detection
vim.filetype.add({
	extension = {
		conf = "conf",
		env = "sh",
		md = "markdown",
		mdx = "markdown",
		yml = "yaml",
		yaml = "yaml",
	},
	filename = {
		[".env"] = "sh",
		["Dockerfile"] = "dockerfile",
		["docker-compose.yml"] = "yaml",
	},
})
