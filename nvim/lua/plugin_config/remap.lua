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
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Search and replace
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

if (vim.loop.os_uname().sysname ~= "Windows_NT") then
    vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
end

