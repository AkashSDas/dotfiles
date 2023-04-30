local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- To show file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Appends line below current line with a space & keeps the cursor in position
keymap("n", "J", "mzJ`z", opts)

-- Move half page up & down, also keeps the cursor in position
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- While going through the search term, it keeps the cursor in the middle of the screen
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Preserves clipboard after paste
keymap("v", "p", '"_dP', opts)
keymap("x", "<leader>p", '"_dP', opts)

-- Keep system and vim clipboard separate
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)

-- Deleting to void register
keymap("n", "<leader>d", '"_d', opts)
keymap("n", "<leader>d", '"_d', opts)

keymap("i", "<C-c>", "<Esc>", opts) -- for multiline edit

-- not working, tmux is there
keymap("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>", opts) -- you can switch between projects


-- vim.keymap.set("n", "<leader>f", function()
--   vim.lsp.buf.format()
-- end)

-- no highlight
keymap("n", "<leader>h", ":noh<CR>", opts)

-- Quick fix navigation
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

-- Find and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>+", "<C-a>")          -- increment by 1
vim.keymap.set("n", "<leader>-", "<C-x>")          -- decrement by 1

vim.keymap.set("n", "<leader>sv", "<C-w>v")        -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s")        -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=")        -- make split window equal width
vim.keymap.set("n", "<leader>sx", ":close<CR>")    -- close current split window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open a new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")     -- got to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")     -- open to previous tab

-- vim maximizer plugin keymap
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
