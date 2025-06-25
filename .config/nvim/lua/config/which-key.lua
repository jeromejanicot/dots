local M = {}

function M.opts()
    return {
        preset = "modern",
        icons = {
            mappings = false,
        },
    }
end

function M.config(_, opts)
    require("which-key").setup(opts)
end

return M
