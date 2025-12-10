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

            completion = {
                menu = {
                    border = 'single',
                    draw = {
                        columns = { { "kind_icon" }, { "label", gap = 1 } },
                        components = {
                            label = {
                                text = function(ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                        },
                    },
                },

                documentation = { window = { border = 'single' } },

                ghost_text = {
                    enabled = false
                },
                list = {
                    selection = { preselect = true, auto_insert = false },
                }
            },

            signature = {
                enabled = true,
                window = { border = 'single' }
            },

            sources = {
                per_filetype = {
                    rust = { inherit_defaults = true, 'crates' },
                }
            }
        },
    },
}
