-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"morhetz/gruvbox",
		as = "gruvbox",
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
	})

	use({
		"juanedi/predawn.vim",
		as = "predawn",
		config = function()
			vim.cmd("colorscheme predawn")
		end,
	})

	use({
		"sainnhe/sonokai",
		as = "sonokai",
		config = function()
			vim.cmd("colorscheme sonokai")
		end,
	})

	use({
		"navarasu/onedark.nvim",
		as = "onedark",
		config = function()
			vim.cmd("colorscheme onedark")
		end,
	})

	use({
		"EdenEast/nightfox.nvim",
		as = "nightfox",
		config = function()
			vim.cmd("colorscheme nightfox")
		end,
	})

	use({
		"sainnhe/everforest",
		as = "everforest",
		config = function()
			vim.cmd("colorscheme everforest")
		end,
	})

	use("nvim-tree/nvim-tree.lua")
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			--[[ { "rafamadriz/friendly-snippets" }, -- Optional ]]
		},
	})

	-- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-autopairs" })
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	use({ "hrsh7th/cmp-cmdline" }) -- Optional
	use("akinsho/toggleterm.nvim")

	-- Formatting
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "prettier/vim-prettier" })
	use({ "eslint/eslint" })

	-- Commenting
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- Allow us to maximize window (for split window management)
	use("szw/vim-maximizer")

	-- tmux navigator
	use("christoomey/vim-tmux-navigator")
end)
