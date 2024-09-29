return {
	"VonHeikemen/lsp-zero.nvim",
	event = "BufEnter",
	branch = "v4.x",

	dependencies = {
		-- Lsp Plugins --
		{ "williamboman/mason-lspconfig.nvim" },
		{ "williamboman/mason.nvim" },
		{ "neovim/nvim-lspconfig" },

		-- Cmp Plugins --
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-path" },
		{ "L3MON4D3/LuaSnip" },
	},

	keys = {
		{ "K",     vim.lsp.buf.hover,          mode = "n", desc = "Lsp Hover" },
		{ "<F2>",  vim.lsp.buf.rename,         mode = "n", desc = "Lsp Rename" },
		{ "<F3>",  vim.lsp.buf.format,         mode = "n", desc = "Lsp Format" },
		{ "<C-s>", "<cmd> silent! write <cr>", mode = "n", desc = "Write File" },
		{ "<F4>",  vim.lsp.buf.code_action,    mode = "n", desc = "Lsp Code Action" },
		{ "[d",    vim.diagnostic.goto_next,   mode = "n", desc = "Go to next Diagnostic" },
		{ "]d",    vim.diagnostic.goto_prev,   mode = "n", desc = "Go to prev Diagnostic" },
	},

	config = function()
		-- LSP SECTION --
		require("lsp-zero").extend_lspconfig({
			sign_text = vim.g.signs
		});

		require("mason").setup();
		require("mason-lspconfig").setup({
			ensure_installed = { "taplo", "yamlls", "rust_analyzer", "lua_ls" },
			handlers = {
				function(server) require("lspconfig")[server].setup({}); end,
				["lua_ls"] = require("tanikaze.lspconfig.lua_ls"),
				["rust_analyzer"] = function () end,
			}
		});

		-- CMP SECTION --
		local luasnip = require("luasnip");
		local cmp = require("cmp");

		local function close_fallback(fallback)
			require("cmp").close();
			fallback();
		end

		local function select_next_item(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = "select" })
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end

		local function select_prev_item(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = "select" })
			elseif luasnip.expand_or_jumpable(-1) then
				luasnip.expand_or_jump(-1)
			else
				fallback()
			end
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body);
				end
			},

			window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered(),
			},

			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = string.format('%s %s', vim.g.kind_icons[vim_item.kind], vim_item.kind);
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
					})[entry.source.name]
					return vim_item
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping(select_prev_item, { "i", "s" }),
				["<Tab>"] = cmp.mapping(select_next_item, { "i", "s" }),

				["<Down>"] = cmp.mapping(close_fallback),
				["<Up>"] = cmp.mapping(close_fallback),

				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			}),
		})
	end
}
