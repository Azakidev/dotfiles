vim.opt.nu = true
vim.opt.relativenumber = false

vim.g.have_nerd_font = true


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.wrap = false


vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true


vim.opt.swapfile = false
vim.opt.backup = false

if (vim.loop.os_uname().sysname == "Windows_NT")
    then
        -- Set shell to powershell
        vim.opt.shell = 'pwsh.exe'
        vim.opt.shellcmdflag = '-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command '
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

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
