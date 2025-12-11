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

            vim.keymap.set({ 'n' }, '<leader>ff', builtin.find_files)
            vim.keymap.set({ 'n' }, '<leader>fg', builtin.live_grep)
            vim.keymap.set({ 'n' }, '<C-g>', builtin.git_files)
            vim.keymap.set({ 'n' }, "<leader>fk", builtin.keymaps)
            vim.keymap.set({ 'n' }, "<leader>t", builtin.builtin)
            vim.keymap.set({ 'n' }, "<leader>sf", builtin.current_buffer_fuzzy_find)
        end
    },
    -- Code actions
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            require("actions-preview").setup {
                diff = {
                    algorithm = "patience",
                    ignore_whitespace = true,
                },
            }
            vim.keymap.set({ "v", "n" }, "<leader>sa", require("actions-preview").code_actions)
        end,
    },
}
