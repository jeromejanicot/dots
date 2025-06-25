local M = {}

function M.opts()
    return {
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
    }
end

function M.config(_, opts)
    require("nvim-tree").setup(opts)
end

return M
