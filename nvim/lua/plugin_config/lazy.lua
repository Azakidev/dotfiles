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
    -- Common dependencies
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    -- Theme
    'Mofiqul/dracula.nvim',
    -- Editor stuff
    'mbbill/undotree',
    'fedepujol/move.nvim',
    'm4xshen/autoclose.nvim',
    "andrewferrier/wrapping.nvim",
    'brenoprata10/nvim-highlight-colors',

    'tpope/vim-fugitive',

    'nvim-treesitter/nvim-treesitter',
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
        }
    },
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "<leader>xq", require("actions-preview").code_actions)
        end,
    },
    'mg979/vim-visual-multi',
    {
        'saecki/crates.nvim',
        config = function()
            require('crates').setup()
        end,
    },
    -- LSP stuff
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    'neovim/nvim-lspconfig',
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Buffer and path
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            -- LuaSnip
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            -- Additional sources
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
        }
    },
    -- Interface stuff
    'nvim-telescope/telescope.nvim',
    'akinsho/toggleterm.nvim',
    'nvim-lualine/lualine.nvim',
    {
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "MunifTanjim/nui.nvim" }
    },
    {
        'romgrk/barbar.nvim',
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = true,
            auto_hide = 1,
            separator_at_end = true,
            icons = {
                separator = { left = '▎', right = '' },
                preset = "default",
            },
            sidebar_filetypes = {
                ['neo-tree'] = true,
                undotree = true,
            },
        },
    },
}

require("lazy").setup(plugins)
require("autoclose").setup()
