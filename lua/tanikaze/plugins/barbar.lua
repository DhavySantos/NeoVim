return {
	"romgrk/barbar.nvim",
	event = "UIEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	keys = {
		{ "<C-q>", "<cmd> BufferPrevious <cr>", mode = { "n" } },
		{ "<C-x>", "<cmd> BufferClose <cr>",    mode = { "n" } },
		{ "<C-X>", "<cmd> BufferClose! <cr>",   mode = { "n" } },
		{ "<C-e>", "<cmd> BufferNext <cr>",     mode = { "n" } },
	},

	config = function()
		require("barbar").setup({
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

		})
	end,

}
