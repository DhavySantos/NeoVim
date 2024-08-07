return {
	"folke/noice.nvim",
	opts = {
		lsp = {
			progress = { enabled = false },
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			inc_rename = false,
			bottom_search = true,
			lsp_doc_border = true,
			command_palette = true,
			long_message_to_split = true,
		},
	},
}
