return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard", -- options: "hard", "medium", "soft"
				overrides = {}, -- Customize specific highlight groups
				bold = false,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				integrations = {
					cmp = true,
					fidget = true,
					gitsigns = true,
					harpoon = true,
					indent_blankline = {
						enabled = false,
						colored_indent_levels = false,
					},
					mason = true,
					native_lsp = {
						enabled = true,
					},
					noice = true,
					notify = true,
					symbols_outline = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
				},
			})

			vim.cmd.colorscheme("gruvbox")
		end,
	},
}

-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		lazy = false,
-- 		priority = 1000,
-- 		config = function()
-- 			require("catppuccin").setup({
-- 				integrations = {
-- 					cmp = true,
-- 					fidget = true,
-- 					gitsigns = true,
-- 					harpoon = true,
-- 					indent_blankline = {
-- 						enabled = false,
-- 						scope_color = "sapphire",
-- 						colored_indent_levels = false,
-- 					},
-- 					mason = true,
-- 					native_lsp = {
-- 						enabled = true,
-- 					},
-- 					noice = true,
-- 					notify = true,
-- 					symbols_outline = true,
-- 					telescope = true,
-- 					treesitter = true,
-- 					treesitter_context = true,
-- 				},
-- 				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
-- 					comments = {}, -- Change the style of comments
-- 					conditionals = {},
-- 					loops = {},
-- 					functions = {},
-- 					keywords = {},
-- 					strings = {},
-- 					variables = {},
-- 					numbers = {},
-- 					booleans = {},
-- 					properties = {},
-- 					types = {},
-- 					operators = {},
-- 					-- miscs = {}, -- Uncomment to turn off hard-coded styles
-- 				},
-- 			})
--
-- 			vim.cmd.colorscheme("catppuccin-macchiato")
-- 		end,
-- 	},
-- }
