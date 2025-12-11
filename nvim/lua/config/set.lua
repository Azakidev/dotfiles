-- Numbers
vim.o.nu = true
vim.o.relativenumber = false
vim.o.signcolumn = 'auto'

-- Nerd font
vim.g.have_nerd_font = true

-- Indenting
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Scrolling
vim.o.scrolloff = 8
vim.o.wrap = false

-- Visuals
vim.o.colorcolumn = "100"
vim.o.termguicolors = true
vim.o.winborder = "rounded"
vim.o.hlsearch = false

-- Undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Folding
vim.o.foldenable = false
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'
