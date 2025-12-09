-- Numbers
vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.signcolumn = 'auto'

-- Nerd font
vim.g.have_nerd_font = true

-- Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.foldenable = false
vim.opt.foldmethod = 'indent'

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.wrap = false

-- Colors
vim.opt.colorcolumn = "100"
vim.opt.termguicolors = true

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

if (vim.loop.os_uname().sysname == "Windows_NT") then
    -- Set shell to powershell on windows
    vim.opt.shell = 'pwsh.exe'
    vim.opt.shellcmdflag = '-NoLogo -NoProfile -NonInteractive -ExecutionPolicy RemoteSigned -Command '
    vim.opt.shellxquote = ''
    vim.opt.shellquote = ''
    vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s'
    vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s'

    -- undodir
    vim.opt.undodir = os.getenv("USERPROFILE") .. "\\.vim\\undodir"
    vim.g.undotree_DiffCommand = "VBinDiff.exe"
else
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end

vim.filetype.add {
    extension = {
        njk = 'html',
    },
}
