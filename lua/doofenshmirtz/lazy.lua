local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets' -- You can load friendly-snippets for more snippets
        },
    },
    {'nvim-telescope/telescope-ui-select.nvim' },
    --'{ryoppippi/sveltekit_inspector.vim'} maybe use later, opens nvim on the element u press
    {'mfussenegger/nvim-dap-python'},
    {
      "nvim-neotest/neotest-python",
      dependencies = {
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
        "nvim-neotest/neotest",
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter"
      }
    },
    {
      'Wansmer/treesj',
      dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
     },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
        'hrsh7th/cmp-nvim-lsp', -- LSP completion
        'hrsh7th/cmp-buffer',   -- Buffer completions
        'hrsh7th/cmp-path',     -- File path completions
        'hrsh7th/cmp-cmdline',  -- Command-line completions
        'L3MON4D3/LuaSnip',     -- Snippet engine
        'saadparwaiz1/cmp_luasnip' -- Snippet completions
        }
    }, 
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    -- Simple plugins can be specified as strings
    'wbthomason/packer.nvim',
    'rstacruz/vim-closer',

    {
        'nvim-telescope/telescope.nvim',
        --tag = '0.1.6',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {'feline-nvim/feline.nvim'},
    'rcarriga/nvim-notify',
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            --vim.cmd('colorscheme rose-pine')
        end
    },

    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

    "nvim-lua/plenary.nvim", -- Make sure plenary is loaded

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },

    'mbbill/undotree',

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    },

    'andweeb/presence.nvim',

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to get the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
})
