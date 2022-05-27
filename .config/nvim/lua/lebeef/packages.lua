local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = execute('!git clone https://github.com/wbthomason/packer.nvim' .. install_path)
end

return require('packer').startup(function(use)  -- "use" arg avoid linter error warning
    -- Packer
    use 'wbthomason/packer.nvim'                        -- Self manage.

    -- LSP
    use 'neovim/nvim-lspconfig'                         -- Collection of common config for Neovim LSC.
    use 'hrsh7th/cmp-nvim-lsp'                          -- nvim-cmp for neovim LSC.
    use 'hrsh7th/cmp-buffer'                            -- nvim-cmp source for buffer words.
    use 'hrsh7th/nvim-cmp'                              -- completion engine plugin for Neovim written in lua.
    use 'onsails/lspkind-nvim'                          -- add vscode-like pictograms to Neovim LSP.
    use 'simrat39/symbols-outline.nvim'                 -- Tree like view for symbols

    -- Neovim Tree sitter
    use {
      'nvim-treesitter/nvim-treesitter',
      commit = '6a437db0124823f9fe89c1de9a3b536ce1f103f3', 
      run = ':TSUpdate'
    }

    -- Snippets
    use 'L3MON4D3/LuaSnip'                              -- Snippers for LSP

    -- Git
    use 'ThePrimeagen/git-worktree.nvim'

   -- Telescope
   use {
      'nvim-lua/popup.nvim',                            -- Popup API.
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
      'nvim-telescope/telescope.nvim',                  -- FZF for neovim.
      requires = { {'nvim-lua/plenary.nvim'} }          -- Lua library for nvim plugins
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'      -- FZF that is compiled.

    use 'folke/tokyonight.nvim'
    use 'arcticicestudio/nord-vim'
    use 'junegunn/seoul256.vim'

    if packer_bootstrap then
      require('packer').sync()
    end
end) 
