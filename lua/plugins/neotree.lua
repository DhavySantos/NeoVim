return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "UIEnter",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		"muniftanjim/nui.nvim",
	},

	keys = {
		{ "<leader>e", "<cmd>Neotree focus <cr>", mode = { "n" } },
		{ "<leader>E", "<cmd>Neotree close <cr>", mode = { "n" } },
	},

	opts = {
		close_if_last_window = true,
		enable_git_status = false,
		window = { width = 30 },

		retain_hidden_root_indent = true,
		hide_root_node = true,

		sort_function = function(a, b)
			if a.type ~= b.type then
				return a.type == "directory"
			end

			return ( a.ext or "~" ) .. a.path < ( b.ext or "~" ) .. b.path
		end,

		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				show_hidden_count = false,
				never_show = { ".DS_Store", ".git" },
				hide_by_pattern = { "*.lock" },
				hide_by_name = {
					"lazy-lock.json",
					"node_modules",
					"target",
					"build",
					"dist",
				},
			},
		},

		default_component_configs = {
			diagnostics = { symbols = vim.g.signs.diagnostics }
		},
	},
}
