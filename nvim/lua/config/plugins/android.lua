return {
    {
        "AlexandrosAlexiou/kotlin.nvim",
        ft = { "kotlin" },
        dependencies = {
            "mason.nvim",
            "oil.nvim",
            "trouble.nvim",
        },

        config = function()
            require("kotlin").setup {
                inlay_hints = { enabled = true },
                folding = { enabled = true },
            }
        end
    },
    {
        "rrxxyz/droid-nvim",
        config = function()
            require("droid").setup({
                android = {
                    auto_launch_app = false,
                    qt_qpa_platform = "wayland",
                }
            })

            vim.keymap.set('n', '<F5>', ":DroidRun<CR>", { desc = "Build and run an android app" })
        end,
    },
}
