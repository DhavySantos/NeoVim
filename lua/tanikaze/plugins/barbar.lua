return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		sidebar_filetypes = {
			["neo-tree"] = {
				event = "BufWipeout",
				text = "Nvim Tree",
				align = "center",
			},

			Outline = {
				event = "BufWinLeave",
				text = "symbols-outline",
				align = "right"
			},
		},
	},
}
