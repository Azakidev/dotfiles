return {
    {
        'tpope/vim-fugitive',
        config = function()
            local opts = { remap = false }

            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

            vim.keymap.set("n", "<leader>p", function()
                vim.cmd.Git('push')
            end, opts)

            -- rebase always
            vim.keymap.set("n", "<leader>P", function()
                vim.cmd.Git('pull --rebase')
            end, opts)
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("gitsigns").setup()
        end
    },
}
