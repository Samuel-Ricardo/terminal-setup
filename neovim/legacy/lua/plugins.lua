local status, packer = pcall (require, 'packer')

if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)

  -- GIT
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  use 'Exafunction/codeium.vim'
    
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lualine/lualine.nvim' --Statusline
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim' 
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  use({  -- LSP Saga - UI's (User Interface)
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = { {"nvim-tree/nvim-web-devicons"} }
  })

  use 'mbbill/undotree' -- 'Ctrl-Z' tree

  use 'kyazdani42/nvim-web-devicons' -- File icons

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim' -- File Finder 
  use 'nvim-lua/plenary.nvim' -- Common Utilities

  -- auto complete
  use 'L3MON4D3/LuaSnip' --Snippet
  use 'onsails/lspkind-nvim' -- VSCode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'akinsho/nvim-bufferline.lua'

  -- Syntaxe Hihglight
  use {
    'nvim-treesitter/nvim-treesitter', -- Now NeoVIm can see the code as a tree, var < fun < obj etc...
    run = ':TSUpdate',
    -- run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'norcalli/nvim-colorizer.lua' -- Hihglight Color

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'dense-analysis/ale'  -- Universal/General Linter Engine
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
end)
