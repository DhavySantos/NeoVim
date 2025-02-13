return {
	"akinsho/bufferline.nvim",
	event = "UIEnter",

	keys = {
		{ "<C-q>", "<cmd> BufferLineCyclePrev <cr>", mode = { "n" } },
		{ "<C-e>", "<cmd> BufferLineCycleNext <cr>", mode = { "n" } },
		{ "<C-x>", "<cmd> BufferLineClose <cr>",     mode = { "n" } },
	},

	config = function()
		require("bufferline").setup({
			options = {
				offsets = { {
					text = "File Explorer",
					filetype = "neo-tree",
					align = "center",
				} }
			}
		})

		vim.api.nvim_create_user_command("BufferLineClose", function()
			local buffers = vim.fn.getbufinfo({ buflisted = 1 })
			local current = vim.fn.bufnr("%")


			if #buffers <= 1 then vim.cmd.enew() end
			vim.cmd.bnext()
			vim.api.nvim_buf_delete(current, {})
		end, { nargs = 0 })
	end
}
