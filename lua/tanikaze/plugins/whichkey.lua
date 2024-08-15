return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").add({
			{ "<leader>e",  "<cmd> Neotree focus <cr>",        desc = "Neotree Focus",              mode = { "n" } },

			{ "<C-e>",      "<cmd> BufferNext <cr>",           desc = "Go To Next Buffer",          mode = { "n" } },
			{ "<C-x>",      "<cmd> BufferClose <cr>",          desc = "Close Focused Buffer",       mode = { "n" } },
			{ "<C-q>",      "<cmd> BufferPrevious <cr>",       desc = "Go To Previous Buffer",      mode = { "n" } },
			{ "<C-X>",      "<cmd> BufferClose! <cr>",         desc = "Forse Close Focused Buffer", mode = { "n" } },

			{ "<leader>fc", "<CMD> Huez <CR>",                 desc = "Select Colorscheme",         mode = { "n" } },
			{ "<leader>fg", "<CMD> Telescope live_grep <CR>",  desc = "Live Grep",                  mode = { "n" } },
			{ "<leader>fk", "<CMD> Telescope keymaps <CR>",    desc = "List Keymaps",               mode = { "n" } },
			{ "<leader>ff", "<CMD> Telescope find_files <CR>", desc = "Find Files",                 mode = { "n" } },
			{ "<leader>f:", "<CMD> Telescope commands <CR>",   desc = "List Commands",              mode = { "n" } },

			{ "<C-w>",      "<cmd> SmartCursorMoveUp <cr>",    desc = "Move Focus to Above Window", mode = { "n", "t" } },
			{ "<C-a>",      "<cmd> SmartCursorMoveLeft <cr>",  desc = "Move Focus to Left Window",  mode = { "n", "t" } },
			{ "<C-s>",      "<cmd> SmartCursorMoveDown <cr>",  desc = "Move Focus to Down Window",  mode = { "n", "t" } },
			{ "<C-d>",      "<cmd> SmartCursorMoveRight <cr>", desc = "Move Focus to Right Window", mode = { "n", "t" } },
		});
	end
};
