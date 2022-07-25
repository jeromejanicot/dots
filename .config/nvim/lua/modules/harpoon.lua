local Remap = require'modules.keymaps'
local nnoremap = Remap.nnoremap
local silent = { silent = true }

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 100,
    }
})

nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader>tc", function() require("harpoon.ui").toggle_quick_menu() end, silent)
nnoremap("<C-1>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<C-2>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<C-3>", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<C-4>", function() require("harpoon.ui").nav_file(4) end, silent)

