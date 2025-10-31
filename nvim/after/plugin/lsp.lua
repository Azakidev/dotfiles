local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
-- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
capabilities.workspace = {
    didChangeWatchedFiles = {
        dynamicRegistration = true,
    },
}

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

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function (event)
        local opts = { buffer = event.buf }

        --vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    end,
})

