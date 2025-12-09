local lspconfig = require("lspconfig")

local capabilities = require('blink.cmp').get_lsp_capabilities()

require('mason').setup()

require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "markdown_oxide",
        "rust_analyzer",

        "html",
        "cssls",
        "ts_ls",
        "emmet_language_server",

        "taplo",
        "jsonls",
    },
    handlers = {
        function(server_name) -- default handler (optional)
            lspconfig[server_name].setup({
                capabilities = capabilities
            })
        end,

        rust_analyzer = function()
            lspconfig.rust_analyzer.setup({
                settings = {
                    ["rust_analyzer"] = {
                        checkOnSave = { command = "clippy -- -W clippy::all" }
                    }
                }
            })
        end,

        markdown_oxide = function()
            lspconfig.markdown_oxide.setup({
                capabilities = capabilities
            })
        end,

        cssls = function()
            lspconfig.cssls.setup({
                capabilities = capabilities
            })
        end,

        -- Fix Undefined global 'vim'
        lua_ls = function()
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
        end
    }
}

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
        end

        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    end,
})
