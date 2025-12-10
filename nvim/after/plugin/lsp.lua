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
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    end,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" } }
        }
    }
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust_analyzer"] = {
            checkOnSave = { command = "clippy -- -W clippy::all" }
        }
    }
})
