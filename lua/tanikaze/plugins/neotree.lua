return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		window = { width = 30 },
		enable_git_status = false,
		close_if_last_window = true,

		default_component_configs = {
			diagnostics = { symbols = { error = "", warn = "", hint = "", info = "" } },
		},

		sort_function = function(a, b)
			if a.type == "directory" and b.type == "directory" then
				return a.path < b.path
			end

			if a.type == "file" and b.type == "file" then
				if a.ext == b.ext then
					if a.name == "mod.rs" then return false end
					if b.name == "mod.rs" then return true end
					return a.name < b.name
				end

				if a.ext ~= nil and b.ext ~= nil then
					return a.ext < b.ext
				end

				if a.ext == nil then return false end
				if b.ext == nil then return true end
				return a.name < b.name
			end

			return a.type < b.type
		end,
	}
}