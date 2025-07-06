local M = {}

M.opts = function()
    return {
        keymap = {
          preset = 'default',
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<Enter>"] = { "select_and_accept", "fallback" },
          ["<C-U>"] = { "scroll_documentation_up", "fallback" },
          ["<C-D>"] = { "scroll_documentation_down", "fallback" },
        },
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
        },
    }
end

M.config = function(_, opts)
    require("blink.cmp").setup(opts)
end

return M
