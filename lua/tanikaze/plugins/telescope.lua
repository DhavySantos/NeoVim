return {
    "nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		require("telescope").load_extension("ui-select");

		require("telescope").setup({
			pickers = { colorscheme = { enable_preview = true } },
		});

	end,
}

