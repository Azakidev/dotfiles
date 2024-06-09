vim.g.mapleader = " "

vim.keymap.set('n', "<leader>rr", vim.cmd.Ex)

vim.keymap.set('n', "<S-Tab>", vim.cmd.BufferNext)
vim.keymap.set('n', "<A-c>", vim.cmd.BufferClose)

vim.keymap.set({ 'n', 'i', 'v' } , "<C-z>", vim.cmd.undo)
vim.keymap.set({ 'n', 'i', 'v' } , "<C-y>", vim.cmd.redo)

vim.keymap.set('n' , "<C-s>", vim.cmd.w)
