vim.g.mapleader = " "

-- Buffer navigation
vim.keymap.set('n', "<A-c>", vim.cmd.BufferClose)

vim.keymap.set('n', "<A-Right>", vim.cmd.BufferNext)
vim.keymap.set('n', "<A-Left>", vim.cmd.BufferPrevious)

-- Undo and redo
vim.keymap.set({ 'n', 'i', 'v' }, "<C-z>", vim.cmd.undo)
vim.keymap.set({ 'n', 'i', 'v' }, "<C-y>", vim.cmd.redo)

-- Write, source and quit
vim.keymap.set('n', "<C-s>", vim.cmd.w)
vim.keymap.set('n', "<A-q>", vim.cmd.q)
vim.keymap.set("n", "<leader><leader>", vim.cmd.so)

-- Search and replace
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- LSP binds
vim.keymap.set("n", "zc", vim.lsp.foldexpr())
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
