return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"jcha0713/cmp-tw2css",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
	},

	config = function()
		local cmp = require("cmp");

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
				},
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"

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
				{ name = "path" },
			}),

			preselect = "item",
		});
	end
}
