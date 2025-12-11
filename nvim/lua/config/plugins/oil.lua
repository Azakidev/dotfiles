return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            delete_to_trash = true,
            watch_for_changes = true,
            skip_confirm_for_simple_edits = true,

            lsp_file_methods = {
                enabled = true,
                timeout_ms = 1000,
                autosave_changes = true,
            },

            view_options = {
                show_hidden = true,
            },
        },

        config = function()
            local oil = require("oil")

            oil.setup()

            vim.keymap.set({ 'n' }, "<leader>e", function()
                if vim.bo.filetype == 'oil' then
                    vim.cmd([[w]])
                    oil.close()
                else
                    vim.cmd([[Oil --float]])
                end
            end, { desc = "File navigation" })
            vim.keymap.set({ 'n' }, "<leader>s", vim.cmd.w)
        end,

        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },
}
