local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local plugins = {
    'Mofiqul/dracula.nvim',

    'mbbill/undotree',
    'fedepujol/move.nvim',
    'm4xshen/autoclose.nvim',

    'tpope/vim-fugitive',

    'nvim-treesitter/nvim-treesitter',
    'habamax/vim-godot',
    {
        'folke/trouble.nvim',
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>xq",
                "<cmd>Trouble diagnostics toggle quickfix<cr>",
                desc = "Quickfix list (Trouble)"
            }

        }
    },
    -- LSP stuff
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    'VonHeikemen/lsp-zero.nvim',
    'neovim/nvim-lspconfig',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'mg979/vim-visual-multi',
    'rafamadriz/friendly-snippets',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    'akinsho/toggleterm.nvim',
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = true,
            auto_hide = 1,
            separator_at_end = true,
        },
    },
}
local opts = {}

require("lazy").setup(plugins, opts)

require("autoclose").setup()
require("toggleterm").setup()
