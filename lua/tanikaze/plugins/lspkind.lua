return {
	"onsails/lspkind.nvim",
	config = function()
		-- setup() is also available as an alias
		require('lspkind').init({
			mode = 'symbol_text',
			symbol_map = {
				Text = "󰉿 ",
				Method = " ",
				Function = "󰊕",
				Constructor = " ",
				Field = " ",
				Variable = "󰫧 ",
				Class = "󰠱 ",
				Interface = " ",
				Module = " ",
				Property = " ",
				Unit = "󰑭 ",
				Value = "󰎠 ",
				Enum = " ",
				Keyword = "",
				Snippet = " ",
				Color = " ",
				File = "",
				Reference = " ",
				Folder = " ",
				EnumMember = " ",
				Constant = "󰏿",
				Struct = "󰙅 ",
				Event = " ",
				Operator = "󰆕",
				TypeParameter = "",
			},
		})
	end
}
