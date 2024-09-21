return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	dependencies = { "windwp/nvim-ts-autotag" },

	opts = {
		auto_install = true,
		indent = { enable = true },
		autotag = { enable = true },
		highlight = { enable = true },
	},
}
