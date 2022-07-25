--
-- Keymaps
--


-- Exported Keymaps
local M = {}

function M.nnoremap(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { noremap = true })
end

function M.vnoremap(lhs, rhs)
    vim.keymap.set("v", lhs, rhs, { noremap = true })
end

local nnoremap = M.nnoremap

-- Set leader key
vim.g.mapleader = " "

vim.cmd([[
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
]])

-- Add line before and after cursor
nnoremap(
    "<Leader><Enter>",
    "O<Esc>"
)
nnoremap(
    "<CR>",
    "o<Esc>"
)

return M
