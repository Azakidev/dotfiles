return {
    {
        'williamboman/mason.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
        },

        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                "lua_ls",
                "markdown_oxide",

                "html",
                "cssls",
                "ts_ls",
                "emmet_language_server",

                "taplo",
                "jsonls",
            },
        },
    }
}
