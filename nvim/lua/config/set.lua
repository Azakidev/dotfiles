-- Numbers
vim.o.nu = true
vim.o.relativenumber = true
vim.o.signcolumn = 'auto'

-- Indenting
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Scrolling
vim.o.scrolloff = 8
vim.o.wrap = false

-- Visuals
vim.o.termguicolors = true
vim.g.have_nerd_font = true
vim.o.colorcolumn = "100"
vim.o.synmaxcol = 300
vim.o.winborder = "rounded"
vim.o.winblend = 0

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- Undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'
vim.o.foldlevel = 99
