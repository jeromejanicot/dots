local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-comp
local cmp = require("cmp")
local source_mapping = {
    buffer = "[BUFFER]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    --cmp_tabnine = "[TN]",
    path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        -- commands to navigate inside the comp suggestion
        ["<C-j>"] = cmp.mapping.scroll_docs(-4),
        ["<C-k>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            vim_item.menu = menu
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    },
})

-- Keybindings for LSP configs.
local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
            Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
            Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
            Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
            Nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
            Nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
            Nnoremap("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
            Nnoremap("<leader>vrr", ":lua vim.lsp.buf.references()<CR>")
            Nnoremap("<leader>vcn", ":lua vim.lsp.buf.rename()<CR>")
            --Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
        end,
    }, _config or {})
end

-- Configurations for SLP.

require("lspconfig").tsserver.setup(config())
require("lspconfig").eslint.setup(config())
require("lspconfig").clangd.setup(config())

-- clang issues to investigate.
-- Other languages to investigate.

local opts = {
    -- Highlight currently hovered symbol. CPU intensive?
    highlight_hovered_item = true,
    
    -- Show outline guides
    show_guides = true,
}

require("symbols-outline").setup(opts)

