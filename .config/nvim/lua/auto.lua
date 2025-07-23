local keymap = vim.keymap

local autocmd = vim.api.nvim_create_autocmd

local augroup = vim.api.nvim_create_augroup
local nvmg = augroup("nvm", {})

autocmd({"BufWritePre"}, {
  group = nvmg,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

return { nvmg, autocmd }
