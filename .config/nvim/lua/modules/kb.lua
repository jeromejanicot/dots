-- Keybindings
-- Add line before and after cursor
Nnoremap(
    "<Leader><Enter>",
    "O<Esc>"
)
Nnoremap(
    "<CR>",
    "o<Esc>"
)
-- Window
-- Create and delete
Nnoremap(
    "<Leader>ww",
    "<C-W>v"
)
Nnoremap(
    "<Leader>wd",
    "<C-W>c"
)
-- Move around
Nnoremap(
    "<Leader>wh",
    "<C-W>h"
)
Nnoremap(
    "<Leader>wj",
    "<C-W>j"
)
Nnoremap(
    "<Leader>wk",
    "<C-W>k"
)
Nnoremap(
    "<Leader>wl",
    "<C-W>l"
)
-- Move line
Nnoremap(
    "<C-j>",
    ":m +1<CR>"
)
Nnoremap(
    "<C-k>",
    ":m -2<CR>"
)
Inoremap(
    "<C-j>",
    "<Esc>:m +1<CR>gi"
)
Inoremap(
    "<C-j>",
    "<Esc>:m -2<CR>gi"
)
Vnoremap(
    "<C-j>",
    ":m '>+1<CR>gv"
)
Vnoremap(
    "<C-j>",
    ":m '>-2<CR>gv"
)

Vnoremap(
    "<",
    "<gv"
)
Vnoremap(
    ">",
    ">gv"
)
