return {
    {
        'folke/trouble.nvim',
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<C-x>",
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
}
