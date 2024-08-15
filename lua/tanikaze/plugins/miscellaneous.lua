return {
	{
		"lewis6991/gitsigns.nvim",
		opts = { current_line_blame = true, sign_priority = 0 }
	},
	{
		"utilyre/barbecue.nvim",
		dependencies = { "SmiteshP/nvim-navic" },
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true
	},
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		"folke/neodev.nvim",
		config = true,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"akinsho/toggleterm.nvim",
		config = true
	},
	{ "mrjones2014/smart-splits.nvim" },
	{ "mg979/vim-visual-multi" },
};
