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
    -- =========================================================================
    -- CORE FUNCTIONALITY - Essential plugins for basic functionality
    -- =========================================================================

    -- LSP and Completion
    {
        "saghen/blink.cmp",
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = "*",
        build = "cargo build --release",
        opts = function()
            return require("config.blink").opts()
        end,
        config = function(_, opts)
            return require("config.blink").config(_, opts)
        end,
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
                "gopls",
                "clangd",
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

    -- Syntax Highlighting and Parsing
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = ":TSUpdate",
        opts = function()
            return require("config.treesitter").opts()
        end,
        config = function(_, opts)
            return require("config.treesitter").config(_, opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "VeryLazy",
        branch = "master",
        opts = function()
            return require("config.treesitter-textobjects").opts()
        end,
        config = function(_, opts)
            return require("config.treesitter-textobjects").config(_, opts)
        end,
    },

    -- =========================================================================
    -- NAVIGATION AND SEARCH - File navigation and search functionality
    -- =========================================================================

    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        opts = function()
            return require("config.fzf").opts()
        end,
        config = function(_, opts)
            return require("config.fzf").config(_, opts)
        end,
        keys = require("config.fzf").keys
    },
    {
        "nvim-tree/nvim-tree.lua",
        keys = { "<space>s" },
        opts = function()
            return require("config.nvim-tree").opts()
        end,
        config = function(_, opts)
            return require("config.nvim-tree").config(_, opts)
        end,
    },
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      opts = function()
        return require("config.harpoon").opts()
      end,
      keys = function()
        return require("config.harpoon").keys()
      end,
    },

    -- =========================================================================
    -- UI/UX ENHANCEMENTS - Interface and user experience improvements
    -- =========================================================================

    {
        "nvim-lualine/lualine.nvim",
        event = "BufRead",
        opts = function()
            return require("config.lualine").opts()
        end,
        config = function(_, opts)
            return require("config.lualine").config(_, opts)
        end,
    },

    -- =========================================================================
    -- GIT INTEGRATION - Git-related functionality
    -- =========================================================================

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
            "ibhagwan/fzf-lua",       -- optional
        },
        event = "User InGitRepo",
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        opts = function()
            return require("config.gitsigns").opts()
        end,
        config = function(_, opts)
            return require("config.gitsigns").config(_, opts)
        end,
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen" },
    },
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        event = "VeryLazy",
        opts = function()
            return require("config.git-conflict").opts()
        end,
        config = function(_, opts)
            return require("config.git-conflict").config(_, opts)
        end,
    },
    {
        "ruifm/gitlinker.nvim",
        event = "User InGitRepo",
        opts = function()
            return require("config.git-linker").opts()
        end,
        config = function(_, opts)
            return require("config.git-linker").config(_, opts)
        end,
    },
    { "rbong/vim-flog",           cmd = { "Flog" } },

    -- =========================================================================
    -- EDITING ENHANCEMENTS - Text manipulation and editing improvements
    -- =========================================================================

    {
        "tpope/vim-commentary",
        keys = {
            { "gc", mode = "n" },
            { "gc", mode = "v" },
        },
    },
    {
        "gbprod/yanky.nvim",
        cmd = "YankyRingHistory",
        opts = function()
            return require("config.yanky").opts()
        end,
        config = function(_, opts)
            return require("config.yanky").config(_, opts)
        end,
    },
    { "simnalamburt/vim-mundo",   cmd = { "MundoToggle", "MundoShow" } },
    { "jdhao/whitespace.nvim",    event = "VeryLazy" },

    -- =========================================================================
    -- UTILITIES AND FILE FORMAT SUPPORT - General utilities and file formats
    -- =========================================================================

    { "tpope/vim-eunuch",         cmd = { "Rename", "Delete" } },
    { "cespare/vim-toml",         ft = { "toml" },                     branch = "main" },
    { "itchyny/vim-highlighturl", event = "BufReadPost" },
    {
      "stevearc/conform.nvim",
      config = function()
        return require("config.conform").config()
      end,
    },

    -- =========================================================================
    -- DEVELOPMENT TOOLS - Debugging and async execution
    -- =========================================================================

    {
        "sakhnik/nvim-gdb",
        enabled = function()
            return vim.g.is_win or vim.g.is_linux
        end,
        build = { "bash install.sh" },
        lazy = true,
    },
    { "skywind3000/asyncrun.vim", lazy = true,      cmd = { "AsyncRun" } },

    -- =========================================================================
    -- SESSION MANAGEMENT - Workflow and session persistence
    -- =========================================================================

    { "tpope/vim-obsession",      cmd = "Obsession" },
}

require("lazy").setup({
    spec = plugin_specs,
    ui = {
        border = "rounded",
        title = "Plugin Manager",
        title_pos = "center"
    }
})
