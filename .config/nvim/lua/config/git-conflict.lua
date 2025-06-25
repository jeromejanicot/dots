local M = {}

function M.opts()
    return {}
end

function M.config(_, opts)
    require("git-conflict").setup(opts)

    vim.api.nvim_create_autocmd("User", {
        pattern = "GitConflictResolved",
        callback = function()
            -- clear qf list
            vim.fn.setqflist({}, "r")

            -- reopen it?
            vim.cmd([[silent! GitConflictListQf]])
        end,
    })
end

return M
