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
vim.keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>')
vim.keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>')
-- Visual mode
vim.keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>')
vim.keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>')
