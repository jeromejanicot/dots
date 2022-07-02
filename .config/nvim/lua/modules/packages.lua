local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)  -- "use" arg avoid linter error warning
    -- Packer
    use 'wbthomason/packer.nvim'                        -- Self manage.

    -- LSP
    use 'neovim/nvim-lspconfig'                         -- Collection of common config for Neovim LSC.
    use 'hrsh7th/nvim-cmp'                              -- completion engine plugin for Neovim written in lua.
    use 'hrsh7th/cmp-nvim-lsp'                          -- nvim-cmp for neovim LSC.
    use 'hrsh7th/cmp-buffer'                            -- nvim-cmp source for buffer words.
    use 'onsails/lspkind-nvim'                          -- add vscode-like pictograms to Neovim LSP.
    use 'simrat39/symbols-outline.nvim'                 -- Tree like view for symbols

    -- Neovim Tree sitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    use 'windwp/nvim-ts-autotag'

    -- Snippets
    use 'L3MON4D3/LuaSnip'                              -- Snippers for LSP
    
    -- Git
    use 'ThePrimeagen/git-worktree.nvim'

    -- FZF
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- Files
    use 'preservim/nerdtree'
    use 'ryanoasis/vim-devicons'
    use {
        'ThePrimeagen/harpoon',
        requires={{'nvim-lua/plenary.nvim'}},
    }
    use 'prettier/vim-prettier'

    -- QoL
    use {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use 'tpope/vim-commentary'
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        requires = {{'tpoppe/vim-commentary'}}
    }

    -- Hydra
    use { 
        'anuvyklack/hydra.nvim',
        requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
    }



    -- Statusline
    use 'vim-airline/vim-airline'

    -- Themes
    use 'sainnhe/everforest'
    use 'arcticicestudio/nord-vim'

    if packer_bootstrap then
      require('packer').sync()
    end
end) 
