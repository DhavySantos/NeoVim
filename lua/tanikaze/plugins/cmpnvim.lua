return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'onsails/lspkind.nvim',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
	},

	config = function()
		local cmp = require("cmp");
		local function close_fallback(fallback)
			require("cmp").close();
			fallback();
		end

		cmp.setup({
			window = {
				completion = cmp.config.window.bordered({ winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None' }),
				documentation = cmp.config.window.bordered(),
			},


			formatting = {
				fields = { 'kind', 'abbr', 'menu' },
				format = function(entry, vim_item)
					local kind = require('lspkind').cmp_format({
						mode = 'symbol_text',
					})(entry, vim_item)

					local strings = vim.split(kind.kind, '%s', { trimempty = true })
					kind.kind = ' ' .. strings[1] .. ' '
					kind.menu = '       ' .. strings[2] .. ' '

					return kind
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Down>"] = cmp.mapping(close_fallback),
				["<Up>"] = cmp.mapping(close_fallback),
				["<C-e>"] = cmp.mapping.abort(),
			}),

			sources = cmp.config.sources({
				{ name = "cmp-tw2css" },
				{ name = "nvim_lsp" },
				{ name = "vsnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			preselect = "item",
		});

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = 'cmdline' } }),
		});
	end
}
