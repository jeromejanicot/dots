local createAutocmd = vim.api.nvim_create_autocmd

local augroup = vim.api.nvim_create_augroup
local nvmg = augroup("nvm", {})

local autocmd = createAutocmd({ "BufWritePre" }, {
	group = nvmg,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})
