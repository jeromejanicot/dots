local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-comp
local cmp = require("cmp")
local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    luasnip = "[LuaSnip]",
    nvim_lua = "[Lua]",
    path = "[Path]",
    latex_symbols = "[Latex]",
}
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- commands to navigate inside the comp suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    }),
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            vim_item.menu = menu
            return vim_item
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },{
        { name = 'buffer' },
    }),
})

-- Keybindings for LSP configs.
local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            LNnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
            LNnoremap("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
            LNnoremap("<leader>vrr", ":lua vim.lsp.buf.references()<CR>")
            LNnoremap("<leader>vcn", ":lua vim.lsp.buf.rename()<CR>")
            LNnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
            LNnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
            LNnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
            LNnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
            LNnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
            Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
        end,
    }, _config or {})
end

-- Configurations for SLP.

require'lspconfig'.tsserver.setup{config()}
require'lspconfig'.eslint.setup{config()}
require'lspconfig'.clangd.setup{config()}
require'lspconfig'.svelte.setup{config()}
require'lspconfig'.dockerls.setup{config()}
require'lspconfig'.gopls.setup{config({
    cmd = {"gopls", "serve"},
    settings ={
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})}


-- clang issues to investigate.
-- Other languages to investigate.

local opts = {
    -- Highlight currently hovered symbol. CPU intensive?
    highlight_hovered_item = true,
    
    -- Show outline guides
    show_guides = true,
}

require("symbols-outline").setup(opts)

