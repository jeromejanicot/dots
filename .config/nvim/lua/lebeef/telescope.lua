local telescope = require 'telescope'
local actions = require 'telescope.actions'
local sorters = require 'telescope.sorters'

require('telescope').setup{
    defaults = {
        file_sorter = sorters.get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,  
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
}

telescope.load_extension("fzy_native")

Nnoremap("<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
Nnoremap("<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>")
Nnoremap("<leader>fb", ":lua require('telescope.builtin').buffers()<cr>")
Nnoremap("<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>")