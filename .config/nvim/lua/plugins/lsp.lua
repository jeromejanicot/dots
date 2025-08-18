return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		{
			"mason-org/mason.nvim",
			cmd = { "Mason", "MasonInstall", "MasonUpdate" },
			build = ":MasonUpdate",
			config = true,
		},
		{
			"mason-org/mason-lspconfig.nvim",
			opt = {
				ensure_installed = {
					"gopls",
					"clangd",
					"lua-language-server",
					"typescript-language-server",
					"rust-analyzer",
					"stylua",
					"black",
					"prettier",
					"prettierd",
					"isort",
				},
			},
		},
		config = function()
			local nvmg, autocmd = require("auto")
			local blink = require("blink")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				blink.get_lsp_capabilities()
			)

			require("mason-lspconfig").setup({
				automatic_enable = true,
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									format = {
										enable = true,
										defaultConfig = {
											indent_style = "space",
											indent_size = "2",
										},
									},
								},
							},
						})
					end,
				},
			})

			blink.setup({
				keymap = {
					preset = "default",
					["<Tab>"] = { "select_next", "fallback" },
					["<S-Tab>"] = { "select_prev", "fallback" },
					["<Enter>"] = { "select_and_accept", "fallback" },
					["<C-U>"] = { "scroll_documentation_up", "fallback" },
					["<C-D>"] = { "scroll_documentation_down", "fallback" },
				},
				appearance = {
					nerd_font_variant = "mono",
				},
				completion = {
					documentation = { auto_show = false },
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
				fuzzy = {
					implementation = "prefer_rust_with_warning",
				},
			})

			vim.diagnostic.config({
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
			-- setup keymaps
			autocmd("LspAttach", {
				group = nvmg,
				callback = function(e)
					local opts = { buffer = e.buf }
					vim.keymap.set("n", "z", function()
						vim.diagnostic.open_float()
					end, opts)
					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, opts)
					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end, opts)
					vim.keymap.set("n", "<leader>vws", function()
						vim.lsp.buf.workspace_symbol()
					end, opts)
					vim.keymap.set("n", "<leader>vd", function()
						vim.diagnostic.open_float()
					end, opts)
					vim.keymap.set("n", "<leader>vca", function()
						vim.lsp.buf.code_action()
					end, opts)
					vim.keymap.set("n", "<leader>vrr", function()
						vim.lsp.buf.references()
					end, opts)
					vim.keymap.set("n", "<leader>vrn", function()
						vim.lsp.buf.rename()
					end, opts)
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, opts)
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.goto_next()
					end, opts)
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.goto_prev()
					end, opts)
				end,
			})
		end,
	},
}
