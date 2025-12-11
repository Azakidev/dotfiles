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


                ghost_text = {
                    enabled = false,
                },
                list = {
                    selection = { preselect = true, auto_insert = false },
                }
            },

            signature = {
                enabled = true,
            },

            sources = {
                per_filetype = {
                    rust = { inherit_defaults = true, 'crates' },
                }
            }
        },
    },
    {
        "xzbdmw/colorful-menu.nvim",
        config = function()
            -- You don't need to set these options.
            require("colorful-menu").setup()
        end
    },
}
