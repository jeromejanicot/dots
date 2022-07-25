local fn = vim.fn
local api = vim.api
local lsp = vim.lsp
local lspconfig = require'lspconfig'
local Remap = require'modules.keymaps'

local custom_attach = function(client, bufnr)
    -- Mappings
    local opts = { silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-i>", vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<space>q", function() vim.diagnostic.setqflist({open = true}) end, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)

    vim.api.nvim_create_autocmd("CursorHold", {
        buffer=bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = "rounded",
                source = "always",
                prefix = " "
            }
            
            if not vim.b.diagnostics_pos then
                vim.b.diagnostics_pos = { nil, nil }
            end

            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            if ( cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2]) and
                #vim.diagnostic.get() > 0
            then
                vim.diagnostic.open_float(nil, opts)
            end

            vim.b.diagnostics_pos = cursor_pos
        end
     })
      -- Set some key bindings conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting_sync, opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        vim.keymap.set("x", "<space>f", vim.lsp.buf.range_formatting, opts)
    end

    -- The below command will highlight the current variable and its usages in the buffer.
    if client.resolved_capabilities.document_highlight then
        vim.cmd([[
        hi! link LspReferenceRead Visual
        hi! link LspReferenceText Visual
        hi! link LspReferenceWrite Visual
        augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]])
    end

    if vim.g.logging_level == 'debug' then
        local msg = string.format("Language server %s started!", client.name)
        vim.notify(msg, 'info', {title = 'Nvim-config'})
    end
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require'cmp_nvim_lsp'.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-comp
local cmp = require("cmp")
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
            --local menu = source_mapping[entry.source.name]
            vim_item.menu = menu
            return vim_item
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, 
    }, {
        { name = 'buffer' },
    })
})

-- cmp_autopairs
local npairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
    'confirm_done',
     cmp_autopairs.on_confirm_done()
)

-- npairs.setup({
--     fast_wrap = {
--       map = '<Shift-e>',
--       chars = { '{', '[', '(', '"', "'" },
--       pattern = [=[[%'%"%)%>%]%)%}%,]]=],
--       end_key = '$',
--       keys = 'qwertyuiopzxcvbnmasdfghjkl',
--       check_comma = true,
--       highlight = 'Search',
--       highlight_grey='Comment'
--     },
-- })

-- Configurations for LSP.

lspconfig.tsserver.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    cmd = { "clang" },
    filetypes = { "c", "cpp", "cc" },
})

lspconfig.gopls.setup({
    on_attach = custom_attach,
    cmd = {"gopls", "serve"},
    settings ={
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})
lspconfig.sumneko_lua.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
    cmd = {"/opt/local/bin/lua-language-server"},
})
lspconfig.eslint.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
})
lspconfig.cssls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}
lspconfig.tailwindcss.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
})


-- Window setup
-- global config for diagnostic
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  signs = true,
  severity_sort = true,
})

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})


