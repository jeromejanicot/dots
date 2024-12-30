local M = {}

function M.setup()
  -- Set up fzf configuration
  vim.g.fzf_layout = {
    window = {
      width = 0.9,
      height = 0.9,
      border = 'rounded'
    }
  }

  -- Colors and styles
  vim.g.fzf_colors = {
    fg = {'fg', 'Normal'},
    bg = {'bg', 'Normal'},
    hl = {'fg', 'Comment'},
    ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
    ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
    ['hl+'] = {'fg', 'Statement'},
    info = {'fg', 'PreProc'},
    border = {'fg', 'Ignore'},
    prompt = {'fg', 'Conditional'},
    pointer = {'fg', 'Exception'},
    marker = {'fg', 'Keyword'},
    spinner = {'fg', 'Label'},
    header = {'fg', 'Comment'}
  }

  -- Preview window settings
  vim.g.fzf_preview_window = {'right:50%:hidden', 'ctrl-/'}

  -- History settings
  vim.g.fzf_history_dir = '~/.local/share/fzf-history'

  -- Action settings
  vim.g.fzf_action = {
    ['ctrl-t'] = 'tab split',
    ['ctrl-x'] = 'split',
    ['ctrl-v'] = 'vsplit'
  }

  -- Custom commands
  vim.api.nvim_create_user_command('Files', function()
    vim.fn['fzf#vim#files']('', {
      source = 'rg --files --hidden --follow --glob "!.git/*"',
      options = '--preview "bat --style=numbers --color=always --line-range :500 {}"'
    })
  end, {})

  -- Key mappings
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<leader>f', ':Files<CR>', opts)
  vim.keymap.set('n', '<leader>b', ':Buffers<CR>', opts)
  vim.keymap.set('n', '<leader>h', ':History<CR>', opts)
  vim.keymap.set('n', '<leader>r', ':Rg<CR>', opts)
  vim.keymap.set('n', '<leader>g', ':GFiles<CR>', opts)
  vim.keymap.set('n', '<leader>m', ':Marks<CR>', opts)

  -- Buffer preview settings
  vim.g.fzf_buffers_jump = 1

  -- Customize Rg command to search file contents
  vim.cmd([[
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)
  ]])

  -- Set up completion if needed
  vim.g.fzf_complete = {
    ['trigger'] = '**',
    ['options'] = {'--reverse'}
  }
end

return M
