local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file) -- add current file to harpoon
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu) -- see files in harpoon

vim.keymap.set("n", "<C-h>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-t>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-n>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<C-s>", function()
	ui.nav_file(4)
end)
