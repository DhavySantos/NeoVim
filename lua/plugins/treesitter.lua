return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	opts = {
		auto_install = true,
		indent = { enable = true },
		highlight = { enable = true },
		ensure_installed = { "rust", "lua", "markdown", "c", }
	},
}
