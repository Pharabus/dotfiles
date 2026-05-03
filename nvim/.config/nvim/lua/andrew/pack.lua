vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name = ev.data.spec.name
        local kind = ev.data.kind
        if kind == 'delete' then return end

        if name == 'nvim-treesitter' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end

        if name == 'LuaSnip' then
            vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path })
        end
    end,
})

vim.pack.add({
    -- colorschemes
    'https://github.com/ellisonleao/gruvbox.nvim',
    'https://github.com/folke/tokyonight.nvim',
    { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },

    -- lsp & completion
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-cmdline',
    { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range('2.x') },
    'https://github.com/saadparwaiz1/cmp_luasnip',
    'https://github.com/j-hui/fidget.nvim',
    'https://github.com/seblyng/roslyn.nvim',
    'https://github.com/rafamadriz/friendly-snippets',

    -- debugging
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/leoluz/nvim-dap-go',
    'https://github.com/rcarriga/nvim-dap-ui',
    'https://github.com/theHamsta/nvim-dap-virtual-text',
    'https://github.com/nvim-neotest/nvim-nio',
    'https://github.com/jay-babu/mason-nvim-dap.nvim',
    'https://github.com/nicholasmata/nvim-dap-cs',

    -- navigation & search
    'https://github.com/nvim-telescope/telescope.nvim',
    { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/christoomey/vim-tmux-navigator',

    -- git
    'https://github.com/tpope/vim-fugitive',

    -- syntax & formatting
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/stevearc/conform.nvim',

    -- ui
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/folke/trouble.nvim',
    'https://github.com/mbbill/undotree',
})

require("andrew.config.colours")
require("andrew.config.lsp")
require("andrew.config.dap")
require("andrew.config.telescope")
require("andrew.config.treesitter")
require("andrew.config.harpoon")
require("andrew.config.fugitive")
require("andrew.config.formatting")
require("andrew.config.trouble")
require("andrew.config.undotree")
require("andrew.config.snippets")
require("andrew.config.lualine")
