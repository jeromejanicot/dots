local M = {}

M.opts = function()
    return {
        keymap = { preset = 'default' },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            documentation = { auto_show = false }
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning"
        }
    }
end

M.config = function(_, opts)
    require("blink.cmp").setup(opts)
end

return M
