local M = {}

function M.opts()
    return {
        ensure_installed = { "python", "cpp", "lua", "vim", "json", "toml", "go" },
        ignore_install = {}, -- List of parsers to ignore installing
        highlight = {
            enable = true,  -- false will disable the whole extension
            disable = { "help" }, -- list of language that will be disabled
        },
    }
end

function M.config(_, opts)
    require("nvim-treesitter.configs").setup(opts)
end

return M
