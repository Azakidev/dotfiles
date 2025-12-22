return {
    {
        "rrxxyz/droid-nvim",
        config = function()
            require("droid").setup({
                android = {
                    auto_launch_app = false,
                    qt_qpa_platform = "xcb",
                }
            })

            vim.keymap.set('n', '<F5>', ":DroidRun<CR>", { desc = "Build and run an android app"})
        end,
    },
}
