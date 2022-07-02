-- Keybindings
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
Nnoremap(
    "<Leader><Enter>",
    "O<Esc>"
)
Nnoremap(
    "<CR>",
    "o<Esc>"
)
-- Move text
-- move line N
Nnoremap(
    "<C-j>",
    ":m +1<CR>"
)
Nnoremap(
    "<C-k>",
    ":m -2<CR>"
)
-- move line I
Inoremap(
    "<C-j>",
    "<Esc>:m +1<CR>gi"
)
Inoremap(
    "<C-j>",
    "<Esc>:m -2<CR>gi"
)
-- move line N
Vnoremap(
    "<C-j>",
    ":m '>+1<CR>gv"
)
Vnoremap(
    "<C-j>",
    ":m '>-2<CR>gv"
)
-- move line N
Vnoremap(
    "<",
    "<gv"
)
Vnoremap(
    ">",
    ">gv"
)
