return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",

	keys = {
		{ "<leader>fc", "<cmd> Telescope colorscheme <cr>", mode = { "n" } },
		{ "<leader>fs", "<cmd> Telescope grep_string <cr>", mode = { "n" } },
		{ "<leader>ff", "<cmd> Telescope find_files <cr>",  mode = { "n" } },
		{ "<leader>fb", "<cmd> Telescope buffers <cr>",     mode = { "n" } },
	},

	dependencies = {
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},

	opts = {
		pickers = {
			colorscheme = { enable_preview = true },
		}
	},

	config = function(_, opts)
		local telescope = require("telescope");

		telescope.load_extension("ui-select");
		telescope.setup(opts);
	end,
}
