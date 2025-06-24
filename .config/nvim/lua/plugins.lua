local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local plugin_specs = {
    {
        "saghen/blink.cmp",
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = "*",
        build = "cargo build --release",
        opts = {
            keymap = { preset = 'default' },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp", "mason-org/mason.nvim" },
        opts = function()
            return require("config.lsp").opts()
        end,
        config = function(_, opts)
            return require("config.lsp").config(_, opts)
        end,
    },
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts_extend = { "ensure_installed" },
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "shfmt",
            }
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            mr:on("package:install:success", function()
                vim.defer_fn(function()
                    -- trigger FileType event to possibly load this newly installed LSP server
                    require("lazy.core.handler.event").trigger({
                        event = "FileType",
                        buf = vim.api.nvim_get_current_buf(),
                    })
                end, 100)
            end)

            mr.refresh(function()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end)
        end,
    },
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        opts = function()
            local fzf_config = require("config.fzf")
            fzf_config.opts()
        end,
        config = function()
            local fzf_config = require("config.fzf")
            fzf_config.config()
        end,
        keys = require("config.fzf").keys
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = ":TSUpdate",
        config = function()
            require("config.treesitter")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "VeryLazy",
        branch = "master",
        config = function()
            require("config.treesitter-textobjects")
        end,
    },
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        opts = function()
            require("config.fzf")
        end,

    },
    {
        "nvim-lualine/lualine.nvim",
        event = "BufRead",
        cond = firenvim_not_active,
        config = function()
            require("config.lualine")
        end,
    },
    { "itchyny/vim-highlighturl", event = "BufReadPost" },
    {
        "tpope/vim-commentary",
        keys = {
            { "gc", mode = "n" },
            { "gc", mode = "v" },
        },
    },

    -- Show undo history visually
    { "simnalamburt/vim-mundo",   cmd = { "MundoToggle", "MundoShow" } },

    -- Manage your yank history
    {
        "gbprod/yanky.nvim",
        config = function()
            require("config.yanky")
        end,
        cmd = "YankyRingHistory",
    },
    -- Handy unix command inside Vim (Rename, Move etc.)
    { "tpope/vim-eunuch", cmd = { "Rename", "Delete" } },

    -- Git command inside vim
    {
        "tpope/vim-fugitive",
        event = "User InGitRepo",
        config = function()
            require("config.fugitive")
        end,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            -- Only one of these is needed.
            "ibhagwan/fzf-lua",       -- optional
        },
        event = "User InGitRepo",
    },

    -- Better git log display
    { "rbong/vim-flog",   cmd = { "Flog" } },
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("config.git-conflict")
        end,
    },
    {
        "ruifm/gitlinker.nvim",
        event = "User InGitRepo",
        config = function()
            require("config.git-linker")
        end,
    },

    -- Show git change (change, delete, add) signs in vim sign column
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns")
        end,
        event = "BufRead",
    },

    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen" },
    },

    -- Asynchronous command execution
    { "skywind3000/asyncrun.vim", lazy = true,     cmd = { "AsyncRun" } },
    { "cespare/vim-toml",         ft = { "toml" }, branch = "main" },

    -- Debugger plugin
    {
        "sakhnik/nvim-gdb",
        enabled = function()
            return vim.g.is_win or vim.g.is_linux
        end,
        build = { "bash install.sh" },
        lazy = true,
    },

    -- Session management plugin
    { "tpope/vim-obsession",   cmd = "Obsession" },

    -- showing keybindings
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("config.which-key")
        end,
    },

    -- show and trim trailing whitespaces
    { "jdhao/whitespace.nvim", event = "VeryLazy" },

    -- file explorer
    {
        "nvim-tree/nvim-tree.lua",
        keys = { "<space>s" },
        config = function()
            require("config.nvim-tree")
        end,
    },



}

require("lazy").setup({
    spec = plugin_specs,
    ui = {
        border = "rounded",
        title = "Plugin Nanager",
        title_pos = "center"
    }
})
