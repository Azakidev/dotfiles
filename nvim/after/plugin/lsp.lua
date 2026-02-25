-- Here go additional configurations for LSP servers
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
        end

        local telescope_builtin = require('telescope.builtin')

        local opts = { buffer = event.buf, silent = true }
        vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)
    end,
})

vim.filetype.add {
    extension = {
        njk = 'html',
    },
}

vim.lsp.config("emmet-ls", {
    capabilities = capabilities,
    filetypes = { "html", "njk", "html.jinja", "jinja", "markdown", "javascript", "javascriptreact" }
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust_analyzer"] = {
            checkOnSave = { command = "clippy -- -W clippy::all" }
        }
    }
})

vim.lsp.config("jinja_lsp", {
    capabilities = capabilities,
    filetypes = { "nunjucks", "njk", "jinja", "html.jinja" },
    root_markers = { "package.json", ".git" },
    settings = {
        template_extensions = { "njk", "html.jinja", "html" },
        templates = './pages/_includes',
    }
})
