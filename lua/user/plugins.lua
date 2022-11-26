local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  --my plugins here
  use "wbthomason/packer.nvim" --Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the popup Api form vim in nvim
  use "nvim-lua/plenary.nvim" -- useful lua functions uset ny lots of plugins
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use "ryanoasis/vim-devicons"
  -- use neotree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- tabbline plug
  use 'nanozuki/tabby.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- terminal plug
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  use {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = {'javascript', 'typescript', 'css', 'less','scss', 'graphql', 'markdown', 'vue', 'html'}
  }

  -- nvim-cmp
  use {
    "hrsh7th/nvim-cmp" , requires = {
      'neovim/nvim-lspconfig',  
      'hrsh7th/cmp-nvim-lsp',  
      'hrsh7th/cmp-buffer',  
      'hrsh7th/cmp-path',  
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    }
  }

  --lightspeed
  use "ggandor/lightspeed.nvim"


  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- lualine settings
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- telescope config
  use {
    'nvim-telescope/telescope.nvim',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- colors scheme
  use 'mhartington/oceanic-next'
  use 'Mofiqul/dracula.nvim'
  use 'gosukiwi/vim-atom-dark'
  use 'connorholyday/vim-snazzy'
  use { "mangeshrex/everblush.vim" }
  use 'owozsh/amora'
  use 'rafalbromirski/vim-aurora'

  use "onsails/lspkind.nvim"

  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'txt','md'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use {'andymass/vim-matchup', event = 'VimEnter'}

  --Automatically set up your configuration after cloning packer.nvim
  -- Put this as the end after plugins
  --
end)
