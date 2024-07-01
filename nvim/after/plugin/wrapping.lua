local opts = {
    auto_set_mode_filetype_allowlist = {
        "asciidoc",
        "gitcommit",
        "latex",
        "markdown",
        "rst",
        "tex",
        "text",
    },
}

require("wrapping").setup(opts)
