vim.g.mapleader = " "

-- Buffer navigation
vim.keymap.set('n', "<A-c>", vim.cmd.BufferClose)

vim.keymap.set('n', "<A-Right>", vim.cmd.BufferNext)
vim.keymap.set('n', "<A-Left>", vim.cmd.BufferPrevious)
vim.keymap.set('n', "<S-A-Right>", vim.cmd.BufferMoveNext)
vim.keymap.set('n', "<S-A-Left>", vim.cmd.BufferMovePrevious)

-- Undo and redo
vim.keymap.set({ 'n', 'i', 'v' }, "<C-z>", vim.cmd.undo)
vim.keymap.set({ 'n', 'i', 'v' }, "<C-y>", vim.cmd.redo)

-- Write, source, and quit
vim.keymap.set('n', "<C-s>", vim.cmd.w)
vim.keymap.set('n', "<A-q>", vim.cmd.q)
vim.keymap.set("n", "<leader><leader>", vim.cmd.so)

-- Search and replace
vim.keymap.set('n', "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Center jumps
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Next search result (Centered)", silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Previous search result (Centered)", silent = true })

-- Better indents
vim.keymap.set('v', '>', '>gv', { desc = "Indent right and reselect", silent = true })
vim.keymap.set('v', '<', '<gv', { desc = "Indent left and reselect", silent = true })

-- Quote word
vim.keymap.set('n', "<C-S-2>", 'ciw"<C-r>""<Esc>', { desc = "Double quote the current word", silent = true})
vim.keymap.set('n', "<C-'>", "ciw'<C-r>\"'<Esc>", { desc = "Double quote the current word", silent = true})
vim.keymap.set('v', "<C-S-2>", 'c"<C-r>""<Esc>', { desc = "Double quote the current block", silent = true})
vim.keymap.set('v', "<C-'>", "c'<C-r>\"'<Esc>", { desc = "Double quote the current block", silent = true})

-- Move lines up/down
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })

-- LSP binds
vim.keymap.set('n', "<leader>f", vim.lsp.buf.format)

-- Copy to clipboard
vim.keymap.set('n', "<leader>a", 'mzggVG"+y`zzzv', { desc = "Copy all to clipboard", silent = true})
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy selection to clipboard", silent = true})
vim.keymap.set({ "n", "x" }, "<leader>d", '"+d', { desc = "Cut selection to clipboard", silent = true})
