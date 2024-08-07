return {
	"yamatsum/nvim-cursorline",
	config = function()
		require('nvim-cursorline').setup {
			cursorline = {
				enable = true,
				number = true,
				timeout = 0,
			},
			cursorword = {
				enable = true,
				min_length = 3,
				hl = { underline = true },
			}
		}
	end
}
