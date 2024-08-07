return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local function close_fallback(fallback)
			require("cmp").close();
			fallback();
		end

		cmp.setup({
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 0,
				}
			},

			formatting = {
				fields = { "kind", "abbr" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.menu = "    (" .. (strings[2] or "") .. ")"
					kind.kind = " " .. (strings[1] or "") .. " "
					return kind
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<C-e>"] = cmp.mapping.abort(),

				["<Down>"] = cmp.mapping(close_fallback),
				["<Up>"] = cmp.mapping(close_fallback),

				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),

		});
	end
}
