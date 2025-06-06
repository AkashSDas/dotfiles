local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
local conform = require("conform")

local M = {}

-- Normal --
-- Disable Space bar since it'll be used as the leader key
nnoremap("<space>", "<nop>")

-- Swap between last two buffers
nnoremap("<leader>'", "<C-^>", {
	desc = "Switch to last buffer",
})

-- Save with leader key
nnoremap("<leader>w", "<cmd>w<cr>", {
	silent = false,
})

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", {
	silent = false,
})

-- Map Oil to <leader>e
nnoremap("<leader>e", function()
	require("oil").toggle_float()
end)

-- Map Undotree to <leader>
nnoremap("<leader>ut", ":UndotreeToggle<CR>", {
	desc = "Toggle [U]ndo[T]ree ",
})

-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("gd", "gdzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")

-- Press 'S' for quick find/replace for the word under the cursor
nnoremap("S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Open Spectre for global find/replace
nnoremap("<leader>S", function()
	require("spectre").toggle()
end)

-- Open Spectre for global find/replace for the word under the cursor in normal mode
-- TODO Fix, currently being overriden by Telescope
nnoremap("<leader>sw", function()
	require("spectre").open_visual({
		select_word = true,
	})
end, {
	desc = "Search current word",
})

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("L", "$")
nnoremap("H", "^")

-- Press 'U' for redo
nnoremap("U", "<C-r>")

-- Turn off highlighted results
nnoremap("<leader>h", "<cmd>noh<cr>")

nnoremap("<leader>tw", function()
	Snacks.toggle.option("wrap")
end, {
	desc = "[T]oggle [Wrap]",
})

-- Diagnostics

-- Goto next diagnostic of any severity
nnoremap("]d", function()
	vim.diagnostic.goto_next({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous diagnostic of any severity
nnoremap("[d", function()
	vim.diagnostic.goto_prev({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next error diagnostic
nnoremap("]e", function()
	vim.diagnostic.goto_next({
		severity = vim.diagnostic.severity.ERROR,
	})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous error diagnostic
nnoremap("[e", function()
	vim.diagnostic.goto_prev({
		severity = vim.diagnostic.severity.ERROR,
	})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next warning diagnostic
nnoremap("]w", function()
	vim.diagnostic.goto_next({
		severity = vim.diagnostic.severity.WARN,
	})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous warning diagnostic
nnoremap("[w", function()
	vim.diagnostic.goto_prev({
		severity = vim.diagnostic.severity.WARN,
	})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Diagnostic movements --

-- Open the diagnostic under the cursor in a float window
nnoremap("<leader>d", function()
	vim.diagnostic.open_float({
		border = "rounded",
	})
end)

-- Place all dignostics into a qflist
nnoremap("<leader>ld", vim.diagnostic.setqflist, {
	desc = "Quickfix [L]ist [D]iagnostics",
})

-- Navigate to next qflist item
nnoremap("<leader>cn", ":cnext<cr>zz")

-- Navigate to previos qflist item
nnoremap("<leader>cp", ":cprevious<cr>zz")

-- Open the qflist
nnoremap("<leader>co", ":copen<cr>zz")

-- Close the qflist
nnoremap("<leader>cc", ":cclose<cr>zz")

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap("<leader>m", ":MaximizerToggle<cr>")

-- Resize split windows to be equal size
nnoremap("<leader>=", "<C-w>=")

-- Press leader f to format
nnoremap("<leader>f", function()
	conform.format({
		async = true,
		timeout_ms = 500,
		lsp_format = "fallback",
	})
end, {
	desc = "Format the current buffer",
})

-- Press leader rw to rotate open windows
nnoremap("<leader>rw", ":RotateWindows<cr>", {
	desc = "[R]otate [W]indows",
})

-- Press gx to open the link under the cursor
nnoremap("gx", ":sil !open <cWORD><cr>", {
	silent = true,
})

-- TSC autocommand keybind to run TypeScripts tsc
nnoremap("<leader>tc", ":TSC<cr>", {
	desc = "[T]ypeScript [C]ompile",
})

-- Harpoon keybinds --
-- Open harpoon ui
nnoremap("<leader>he", function()
	harpoon_ui.toggle_quick_menu()
end)

-- Add current file to harpoon
nnoremap("<leader>ha", function()
	harpoon_mark.add_file()
end)

-- Remove current file from harpoon
nnoremap("<leader>hr", function()
	harpoon_mark.rm_file()
end)

-- Remove all files from harpoon
nnoremap("<leader>hc", function()
	harpoon_mark.clear_all()
end)

-- Quickly jump to harpooned files
nnoremap("<leader>1", function()
	harpoon_ui.nav_file(1)
end)

nnoremap("<leader>2", function()
	harpoon_ui.nav_file(2)
end)

nnoremap("<leader>3", function()
	harpoon_ui.nav_file(3)
end)

nnoremap("<leader>4", function()
	harpoon_ui.nav_file(4)
end)

nnoremap("<leader>5", function()
	harpoon_ui.nav_file(5)
end)

-- Telescope keybinds --
nnoremap("<leader>?", require("telescope.builtin").oldfiles, {
	desc = "[?] Find recently opened files",
})
nnoremap("<leader>sb", require("telescope.builtin").buffers, {
	desc = "[S]earch Open [B]uffers",
})
nnoremap("<leader>sf", function()
	require("telescope.builtin").find_files({
		hidden = true,
	})
end, {
	desc = "[S]earch [F]iles",
})
nnoremap("<leader>sh", require("telescope.builtin").help_tags, {
	desc = "[S]earch [H]elp",
})
nnoremap("<leader>sg", require("telescope.builtin").live_grep, {
	desc = "[S]earch by [G]rep",
})

nnoremap("<leader>sc", function()
	require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, {
	desc = "[S]earch [C]ommands",
})

nnoremap("<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, {
	desc = "[/] Fuzzily search in current buffer]",
})

nnoremap("<leader>ss", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, {
	desc = "[S]earch [S]pelling suggestions",
})

-- LSP Keybinds (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer) --
M.map_lsp_keybinds = function(buffer_number)
	nnoremap("<leader>rn", vim.lsp.buf.rename, {
		desc = "LSP: [R]e[n]ame",
		buffer = buffer_number,
	})
	nnoremap("<leader>ca", vim.lsp.buf.code_action, {
		desc = "LSP: [C]ode [A]ction",
		buffer = buffer_number,
	})

	nnoremap("gd", vim.lsp.buf.definition, {
		desc = "LSP: [G]oto [D]efinition",
		buffer = buffer_number,
	})

	-- Telescope LSP keybinds --
	nnoremap("gr", require("telescope.builtin").lsp_references, {
		desc = "LSP: [G]oto [R]eferences",
		buffer = buffer_number,
	})

	nnoremap("gi", require("telescope.builtin").lsp_implementations, {
		desc = "LSP: [G]oto [I]mplementation",
		buffer = buffer_number,
	})

	nnoremap("<leader>bs", require("telescope.builtin").lsp_document_symbols, {
		desc = "LSP: [B]uffer [S]ymbols",
		buffer = buffer_number,
	})

	nnoremap("<leader>ps", require("telescope.builtin").lsp_workspace_symbols, {
		desc = "LSP: [P]roject [S]ymbols",
		buffer = buffer_number,
	})

	-- See `:help K` for why this keymap
	-- nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
	nnoremap("<leader>k", vim.lsp.buf.signature_help, {
		desc = "LSP: Signature Documentation",
		buffer = buffer_number,
	})
	inoremap("<C-k>", vim.lsp.buf.signature_help, {
		desc = "LSP: Signature Documentation",
		buffer = buffer_number,
	})

	-- Lesser used LSP functionality
	nnoremap("gD", vim.lsp.buf.declaration, {
		desc = "LSP: [G]oto [D]eclaration",
		buffer = buffer_number,
	})
	nnoremap("td", vim.lsp.buf.type_definition, {
		desc = "LSP: [T]ype [D]efinition",
		buffer = buffer_number,
	})
end

-- Symbol Outline keybind
nnoremap("<leader>so", ":SymbolsOutline<cr>")

-- nvim-ufo keybinds
-- nnoremap("zR", require("ufo").openAllFolds)
-- nnoremap("zM", require("ufo").closeAllFolds)

-- toggle inlay hints
nnoremap("<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end)

-- Insert --
-- Map jj and JJ to <esc>
inoremap("jj", "<esc>")
inoremap("JJ", "<esc>")

-- Visual --
-- Disable Space bar since it'll be used as the leader key
vnoremap("<space>", "<nop>")

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vnoremap("L", "$<left>")
vnoremap("H", "^")

vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

-- Paste without losing the contents of the register
xnoremap("<leader>p", '"_dP')

-- Reselect the last visual selection
xnoremap("<<", function()
	-- Move selected text up/down in visual mode
	vim.cmd("normal! <<")
	vim.cmd("normal! gv")
end)

xnoremap(">>", function()
	vim.cmd("normal! >>")
	vim.cmd("normal! gv")
end)

vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Move half page up & down, also keeps the cursor in position
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Terminal --
-- Enter normal mode while in a terminal
tnoremap("<esc>", [[<C-\><C-n>]])
tnoremap("jj", [[<C-\><C-n>]])

-- Window navigation from terminal
tnoremap("<C-h>", [[<Cmd>wincmd h<CR>]])
tnoremap("<C-j>", [[<Cmd>wincmd j<CR>]])
tnoremap("<C-k>", [[<Cmd>wincmd k<CR>]])
tnoremap("<C-l>", [[<Cmd>wincmd l<CR>]])

-- nnoremap("<leader>sv", "<C-w>v")     -- split window vertically
-- nnoremap("<leader>sh", "<C-w>s")     -- split window horizontally
-- nnoremap("<leader>se", "<C-w>=")     -- make split window equal width
-- nnoremap("<leader>sx", ":close<CR>") -- close current split window

-- Navigate between split windows
-- nnoremap("<C-h>", "<C-w>h") -- Move left
-- nnoremap("<C-l>", "<C-w>l") -- Move right
-- nnoremap("<C-j>", "<C-w>j") -- Move down
-- nnoremap("<C-k>", "<C-w>k") -- Move up

nnoremap("<C-h>", ":TmuxNavigateLeft<CR>")
nnoremap("<C-j>", ":TmuxNavigateDown<CR>")
nnoremap("<C-k>", ":TmuxNavigateUp<CR>")
nnoremap("<C-l>", ":TmuxNavigateRight<CR>")

-- Move text up and down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Resize split windows
nnoremap("<S-wk>", ":resize +3<CR>") -- Increase height
nnoremap("<S-wj>", ":resize -2<CR>") -- Decrease height
nnoremap("<S-wh>", ":vertical resize -2<CR>") -- Decrease width
nnoremap("<S-wl>", ":vertical resize +2<CR>") -- Increase width

-- Reenable default <space> functionality to prevent input delay
tnoremap("<space>", "<space>")

-- Press leader f to format
nnoremap("<leader>f", function()
	conform.format({
		async = true,
		timeout_ms = 500,
		lsp_format = "fallback",
	})
end, { desc = "Format the current buffer" })

return M
