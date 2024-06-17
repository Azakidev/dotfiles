require("toggleterm").setup()
vim.keymap.set('n', '<leader>t', ":ToggleTerm size=50 direction=vertical<CR>i")
vim.keymap.set('t', '<leader>t', "<C-\\><C-n>:ToggleTerm size=50 direction=vertical<CR>")
