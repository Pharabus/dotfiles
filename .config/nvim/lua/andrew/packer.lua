local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use ({ "ellisonleao/gruvbox.nvim",
        as = 'gruvbox',
        config = function()
                vim.cmd('colorscheme gruvbox')
            end
        })
   use {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
-- or                            , branch = '0.1.x',
     requires = {
         {'nvim-lua/plenary.nvim'},
         {'nvim-tree/nvim-web-devicons'}
  },
  }
  use({'prichrd/netrw.nvim'})
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
  'VonHeikemen/lsp-zero.nvim',
     requires = {
     -- LSP Support
     {'neovim/nvim-lspconfig'},
     {'williamboman/mason.nvim'},
     {'williamboman/mason-lspconfig.nvim'},

     -- Autocompletion
     {'hrsh7th/nvim-cmp'},
     {'hrsh7th/cmp-buffer'},
     {'hrsh7th/cmp-path'},
     {'saadparwaiz1/cmp_luasnip'},
     {'hrsh7th/cmp-nvim-lsp'},
     {'hrsh7th/cmp-nvim-lua'},

     -- Snippets
     {'L3MON4D3/LuaSnip'},
     {'rafamadriz/friendly-snippets'},

     -- DAP
     {'mfussenegger/nvim-dap'},
     {'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'}},
     {'theHamsta/nvim-dap-virtual-text'},
     {'nvim-telescope/telescope-dap.nvim'},
     {'nvim-neotest/nvim-nio'},
   }
 }
 use('christoomey/vim-tmux-navigator')
 use {
 'nvim-lualine/lualine.nvim',
    requires = {'nvim-tree/nvim-web-devicons'}
 }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


