local tele = require'telescope.builtin'
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
    defaults = {
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        multi_icon = "<>",

    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    pickers = {
        find_files = {
            hidden=true,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                            -- the default case_mode is "smart_case"
    }
  }
}

Nnoremap (
	"<Leader>ff",
	":lua require('telescope.builtin').find_files()<cr>"
)
Nnoremap (
	"<Leader>fg",
	":lua require('telescope.builtin').live_grep()<cr>"
)
Nnoremap (
	"<Leader>fb",
	":lua require('telescope.builtin').buffers()<cr>"
)
Nnoremap (
	"<Leader>fh",
	":lua require('telescope.builtin').help_tags()<cr>"
)

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
