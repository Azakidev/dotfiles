return {
    'nvim-lualine/lualine.nvim',
    {
        'romgrk/barbar.nvim',
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = true,
            auto_hide = 1,
            separator_at_end = false,
            icons = {
                separator = { left = '▎', right = '' },
                separator_at_end = false,
                preset = "default",
            },
            sidebar_filetypes = {
                ['neo-tree'] = true,
                undotree = true,
                filesystem = true,
            },
        },
    },
}
