return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            local builtin = require('telescope.builtin')
            local telescope = require('telescope')

            telescope.setup({
                defaults = {
                    file_ignore_patterns = {
                        ".git/",
                        ".cache",
                        "%.o",
                        "%.a",
                        "%.out",
                        "%.class",
                        "%.pdf",
                        "%.mkv",
                        "%.mp4",
                        "%.png",
                        "%.jpeg",
                        "%.zip"
                    },
                },
            })

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<C-g>', builtin.git_files, {})
        end
    },
    -- Code actions
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "<leader>xq", require("actions-preview").code_actions)
        end,
    },
}
