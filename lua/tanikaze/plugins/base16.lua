return {
	"RRethy/base16-nvim",
	config = function()
		require('base16-colorscheme').with_config({
			indentblankline = true,
			illuminate = true,
			ts_rainbow = true,
			telescope = true,
			notify = true,
			dapui = true,
			cmp = true,
		})
	end
}
