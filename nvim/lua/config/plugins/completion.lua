return {
    {
        'saghen/blink.cmp',

        dependencies = 'rafamadriz/friendly-snippets',

        version = 'v1.*',

        opts = {
            keymap = { preset = 'super-tab' },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            signature = { enabled = true },

            completion = {
                menu = { border = 'single' },
                ghost_text = {
                    enabled = false
                },
                list = {
                    selection = { preselect = true, auto_insert = false },
                }
            },

            sources = {
                per_filetype = {
                    rust = { inherit_defaults = true, 'crates' },
                }
            }
        },
    },
}
