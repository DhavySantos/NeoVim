return {
	{ "catppuccin/nvim",          name = "catppuccin", priority = 1000, config = true, opts = {} },
	{ "folke/tokyonight.nvim",    name = "tokyonight", priority = 1000, config = true, opts = {} },
	{ "rose-pine/neovim",         name = "rose-pine",  priority = 1000, config = true, opts = {} },
	{ "ellisonleao/gruvbox.nvim", name = "gruvbox",    priority = 1000, config = true, opts = {} },
	{

		"vague2k/huez.nvim",
		opts = {
			exclude = {
				"desert", "evening", "industry", "koehler", "morning", "murphy", "pablo", "peachpuff", "ron", "shine", "slate",
				"torte", "zellner", "blue", "darkblue", "delek", "quiet", "elflord", "habamax", "lunaperche", "zaibatsu",
				"wildcharm", "sorbet", "vim", "retrobox", "default" },
		},
	}
}
