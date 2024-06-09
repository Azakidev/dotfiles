require('neo-tree').setup({
    close_if_last_window = true,
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignore = false,
        },
        follow_current_file = {
            leave_dirs_open = true
        },
        group_empty_dirs = true
    }
})

vim.keymap.set('n', "<leader>s", ":Neotree toggle<CR>")
vim.keymap.set('n', "<leader>fs", ":Neotree<CR>")
