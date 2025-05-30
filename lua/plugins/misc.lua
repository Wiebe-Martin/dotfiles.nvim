-- Standalone plugins with less than 10 lines of config go here
return {
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		end,
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		-- Hints keybinds
		"folke/which-key.nvim",
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"ThePrimeagen/vim-be-good",
	},
	{
		"prichrd/netrw.nvim",
		opts = {},
	},
	{
		-- Markdown viewer
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
		setup = function()
			require("glow").setup({
				width_ratio = 1, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
				height_ratio = 1,
			})
		end,
	},
}
