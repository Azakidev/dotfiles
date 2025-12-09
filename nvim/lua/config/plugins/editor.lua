return {
    'nvim-lualine/lualine.nvim',
    'mg979/vim-visual-multi',
    'brenoprata10/nvim-highlight-colors',
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
            vim.keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>')
            vim.keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>')
            -- Visual mode
            vim.keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>')
            vim.keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>')
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

            vim.keymap.set('n', "<leader>s", ":Neotree toggle<CR>")
            vim.keymap.set('n', "<leader>fs", vim.cmd.Neotree)
        end
    },
}
