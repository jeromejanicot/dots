local Hydra = require('hydra')

Hydra({
   name = 'Window Nav',
   mode = 'n',
   body = '<Leader>w',
   heads = {
      { 'w', '<C-W>v', { desc = 'create window'} },
      { 's', '<C-W>s', { desc = 'create split'} },
      { 'd', '<C-W>c', { desc = 'delete window'} },
      { 'h', '<C-W>h', { desc = 'left window'} },
      { 'j', '<C-W>j', { desc = 'bottom window'} },
      { 'k', '<C-W>k', { desc = 'top window'} },
      { 'l', '<C-W>l', {desc = 'right window'} },
   },
   config = {
       exit = false,
   }
})
