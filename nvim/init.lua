-- Settings
require("config.remap")
require("config.set")
-- Lazy
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        io.stdout:write("\027[>1u")
    end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        io.stdout:write("\027[<1u")
    end,
})
