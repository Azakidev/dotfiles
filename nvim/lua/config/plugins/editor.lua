return {
    'nvim-lualine/lualine.nvim',
    -- 'mg979/vim-visual-multi',
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({
                render = 'background',
                enable_var_usage = true,
            })
        end
    },
    {
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup()
        end
    },
    {
        'fedepujol/move.nvim',
        config = function()
            require('move').setup({
                line = {
                    enable = true, -- Enables line movement
                    indent = true  -- Toggles indentation
                },
                block = {
                    enable = true, -- Enables block movement
                    indent = true  -- Toggles indentation
                }
            })
            -- Normal mode
            vim.keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>', { silent = true })
            vim.keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>', { silent = true })
            -- Visual mode
            vim.keymap.set({ 'v', 'x' }, '<A-Up>', ':MoveBlock(-1)<CR>', { silent = true })
            vim.keymap.set({ 'v', 'x' }, '<A-Down>', ':MoveBlock(1)<CR>', { silent = true })
        end
    },
    {
        'm4xshen/autoclose.nvim',
        config = function()
            require("autoclose").setup()
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require('neo-tree').setup({
                close_if_last_window = true,
                window = { width = 30 },
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignore = false,
                    },
                    follow_current_file = {
                        leave_dirs_open = true
                    },
                    group_empty_dirs = true
                }
            })

            vim.keymap.set('n', "<leader>s", ":Neotree toggle<CR>", { silent = true })
        end
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
                filesystem = true,
            },
        },
    },
}
