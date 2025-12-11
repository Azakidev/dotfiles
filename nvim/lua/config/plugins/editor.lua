return {
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({
                render = 'background',
                enable_var_usage = true,
            })
        end
    },
    {
        'fedepujol/move.nvim',
        config = function()
            require('move').setup({
                line = {
                    enable = true, -- Enables line movement
                    indent = true  -- Toggles indentation
                },
                block = {
                    enable = true, -- Enables block movement
                    indent = true  -- Toggles indentation
                }
            })
            -- Normal mode
            vim.keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>', { silent = true })
            vim.keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>', { silent = true })
            -- Visual mode
            vim.keymap.set({ 'v', 'x' }, '<A-Up>', ':MoveBlock(-1)<CR>', { silent = true })
            vim.keymap.set({ 'v', 'x' }, '<A-Down>', ':MoveBlock(1)<CR>', { silent = true })
        end
    },
    {
        'm4xshen/autoclose.nvim',
        config = function()
            require("autoclose").setup()
        end
    },
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()

            vim.keymap.set({ "n", "x" }, "<C-up>", function() mc.matchAddCursor(-1) end)
            vim.keymap.set({ "n", "x" }, "<C-down>", function() mc.matchAddCursor(1) end)

            -- Add and remove cursors with control + left click.
            vim.keymap.set("n", "<C-leftmouse>", mc.handleMouse)
            vim.keymap.set("n", "<C-leftdrag>", mc.handleMouseDrag)
            vim.keymap.set("n", "<C-leftrelease>", mc.handleMouseRelease)

            -- Disable and enable cursors.
            vim.keymap.set({ "n", "x" }, "<C-q>", mc.toggleCursor)

            -- Mappings defined in a keymap layer only apply when there are
            -- multiple cursors. This lets you have overlapping mappings.
            mc.addKeymapLayer(function(layerSet)
                -- Select a different cursor as the main one.
                layerSet({ "n", "x" }, "<left>", mc.prevCursor)
                layerSet({ "n", "x" }, "<right>", mc.nextCursor)

                -- Delete the main cursor.
                layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

                -- Enable and clear cursors using escape.
                layerSet("n", "<esc>", function()
                    if not mc.cursorsEnabled() then
                        mc.enableCursors()
                    else
                        mc.clearCursors()
                    end
                end)
            end)
        end
    },
}
