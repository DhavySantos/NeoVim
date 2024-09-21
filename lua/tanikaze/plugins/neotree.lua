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
		window = { width = 30 },
		enable_git_status = false,
		close_if_last_window = true,

		hide_root_node = true,
		retain_hidden_root_indent = true,

		filesystem = {
			filtered_items = {
				show_hidden_count = false,
				never_show = { ".DS_Store" },
			},
		},

		default_component_configs = {
			diagnostics = {
				symbols = {
					error = vim.g.signs.error,
					warn = vim.g.signs.warn,
					hint = vim.g.signs.hint,
					info = vim.g.signs.info,
				},
			},
			indent = {
				expander_collapsed = '',
				expander_expanded = '',
				with_expanders = true,
			},
		},

		sort_function = function(a, b)
			-- Both are directories
			if a.type == "directory" and b.type == "directory" then
				return a.path < b.path
			end

			-- Both are files
			if a.type == "file" and b.type == "file" then
				-- If both files have the same extension
				if a.ext == b.ext then
					-- Prioritize "mod.rs" file
					if a.name == "mod.rs" then return false end
					if b.name == "mod.rs" then return true end
					-- Sort by name if extensions are the same
					return a.name < b.name
				end

				-- Sort by extension
				if a.ext ~= nil and b.ext ~= nil then
					return a.ext < b.ext
				end

				-- Handle files with no extension
				if a.ext == nil then return false end
				if b.ext == nil then return true end
				return a.name < b.name
			end

			-- Directories before files
			return a.type < b.type
		end
	},
}
