-- Here go additional configurations for LSP servers

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

vim.lsp.config("emmet-ls", {
    filetypes = { "html", "njk", "markdown", "javascript", "javascriptreact" }
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust_analyzer"] = {
            checkOnSave = { command = "clippy -- -W clippy::all" }
        }
    }
})

vim.filetype.add {
    extension = {
        njk = 'html',
    },
}
