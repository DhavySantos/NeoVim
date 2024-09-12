return {
	"VonHeikemen/lsp-zero.nvim",
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

	config = function()
		local map = vim.keymap.set;

		-- LSP SECTION --
		local lsp_attach = function(_, bufnr)
			local opts = { buffer = bufnr, silent = true, noremap = true };

			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				signs = false,
			});

			map("n", "K", vim.lsp.buf.hover, opts);

			map("n", "<F2>", vim.lsp.buf.rename, opts);
			map("n", "<F3>", vim.lsp.buf.format, opts);
			map("n", "<F4>", vim.lsp.buf.code_action, opts);

			map("n", "[d", vim.diagnostic.goto_next, opts);
			map("n", "]d", vim.diagnostic.goto_prev, opts);
		end

		require("lsp-zero").extend_lspconfig({
			lsp_attach = lsp_attach,
			sign_text = {
				error = vim.g.signs.error,
				warn = vim.g.signs.warn,
				hint = vim.g.signs.hint,
				info = vim.g.signs.info,
			}
		});

		require("mason").setup({ PATH = "append" });
		require("mason-lspconfig").setup({
			ensure_installed = { "taplo", "rust_analyzer", "lua_ls" };
			handlers = { function(server_name)
				require("lspconfig")[server_name].setup({});
			end}
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
				completion = cmp.config.window.bordered({}),
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
		});
	end
}
