local lsp = require('lsp-zero')
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.preset('recommended')

require('mason').setup()

require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "marksman",
        "rust_analyzer",

        "html",
        "cssls",
        "tsserver",

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

        cssls = function()
            lspconfig.cssls.setup({
                capabilities = capabilities
            })
        end,

        -- Fix Undefined global 'vim'
        lua_ls = function()
            lsp.configure('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
        end
    }
}

---@diagnostic disable-next-line: unused-local
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

lsp.setup()
