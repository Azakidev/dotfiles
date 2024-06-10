vim.g.mapleader = " "

vim.keymap.set('n', "<leader>rr", vim.cmd.Ex)

vim.keymap.set('n', "<S-Tab>", vim.cmd.BufferNext)
vim.keymap.set('n', "<A-c>", vim.cmd.BufferClose)

vim.keymap.set({ 'n', 'i', 'v' }, "<C-z>", vim.cmd.undo)
vim.keymap.set({ 'n', 'i', 'v' }, "<C-y>", vim.cmd.redo)

vim.keymap.set('n', "<C-s>", vim.cmd.w)
vim.keymap.set('n', "<A-q>", vim.cmd.q)

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

if (vim.loop.os_uname().sysname ~= "Windows_NT") then
    vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
end

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
