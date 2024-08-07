return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").add({
			{ "<C-e>",      "<cmd> BufferNext <cr>",           desc = "Go To Next Buffer" },
			{ "<C-x>",      "<cmd> BufferClose <cr>",          desc = "Close Focused Buffer" },
			{ "<C-q>",      "<cmd> BufferPrevious <cr>",       desc = "Go To Previous Buffer" },
			{ "<C-X>",      "<cmd> BufferClose! <cr>",         desc = "Forse Close Focused Buffer" },

			{ "<leader>e",  "<cmd> Neotree focus <cr>",        desc = "Neotree Focus" },

			{ "<C-k>",      "<cmd> move .-2 <cr>",             desc = "Move Currenty Line Up",      mode = { "n" } },
			{ "<C-j>",      "<cmd> move .+1 <cr>",             desc = "Move Currenty Line Down",    mode = { "n" } },

			{ "<leader>fc", "<CMD> Huez <CR>",                 desc = "Select Colorscheme",         mode = { "n" } },
			{ "<leader>fg", "<CMD> Telescope live_grep <CR>",  desc = "Live Grep",                  mode = { "n" } },
			{ "<leader>fk", "<CMD> Telescope keymaps <CR>",    desc = "List Keymaps",               mode = { "n" } },
			{ "<leader>ff", "<CMD> Telescope find_files <CR>", desc = "Find Files",                 mode = { "n" } },
			{ "<leader>f:", "<CMD> Telescope commands <CR>",   desc = "List Commands",              mode = { "n" } },

			{ "<F2>",       vim.lsp.buf.format,                desc = "Lsp Format",                 mode = { "n" } },
			{ "<leader>rn", vim.lsp.buf.rename,                desc = "Lsp Rename",                 mode = { "n" } },
			{ "<leader>ca", vim.lsp.buf.code_action,           desc = "Lsp Code Action",            mode = { "n" } },
			{ "<leader>[d", vim.diagnostic.goto_next,          desc = "Go to Next Diagnostic",      mode = { "n" } },
			{ "<leader>]d", vim.diagnostic.goto_prev,          desc = "Go to Prev Diagnostic",      mode = { "n" } },

			{ "<C-w>",      "<cmd> SmartCursorMoveUp <cr>",    desc = "Move Focus to Above Window", mode = { "n", "t" } },
			{ "<C-a>",      "<cmd> SmartCursorMoveLeft <cr>",  desc = "Move Focus to Left Window",  mode = { "n", "t" } },
			{ "<C-s>",      "<cmd> SmartCursorMoveDown <cr>",  desc = "Move Focus to Down Window",  mode = { "n", "t" } },
			{ "<C-d>",      "<cmd> SmartCursorMoveRight <cr>", desc = "Move Focus to Right Window", mode = { "n", "t" } },
		});
	end
};
