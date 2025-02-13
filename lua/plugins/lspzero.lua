return {
	"VonHeikemen/lsp-zero.nvim",
	event = "BufEnter",
	branch = "v4.x",

	dependencies = {
		-- Lsp Plugins --
		"williamboman/mason-lspconfig.nvim",

		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",

		-- Cmp Plugins --
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},

	keys = {
		{ "K",    vim.lsp.buf.hover,       mode = "n", desc = "Lsp Hover" },
		{ "<F2>", vim.lsp.buf.rename,      mode = "n", desc = "Lsp Rename" },
		{ "<F3>", vim.lsp.buf.format,      mode = "n", desc = "Lsp Format" },
		{ "<F4>", vim.lsp.buf.code_action, mode = "n", desc = "Lsp Code Action" },
	},

	config = function()
		local signs = vim.g.signs

		require("lsp-zero").extend_lspconfig({ sign_text = signs.diagnostics })

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(_, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end
		})

		-- this might cause issue if using nix on non nixos system
		-- use lspconfig when using nixos
		if os.getenv("NIX_PATH") then
			require("lspconfig").taplo.setup({})
			require("lspconfig").nil_ls.setup({})
			require("lspconfig").rust_analyzer.setup({})
			require("lspconfig").lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
		end

		-- Use Mason with not using nixos
		if not os.getenv("NIX_PATH") then
			require("mason").setup({});
			require("mason-lspconfig").setup_handlers({
				function(server)
					require("lspconfig")[server].setup({})
				end
			})
		end

		local cmp = require("cmp")

		local close_fallback = function(fallback)
			if cmp.visible() then cmp.close() end
			fallback()
		end

		cmp.setup({
			window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered(),
			},

			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s %s", signs.kind[vim_item.kind], vim_item.kind)
					vim_item.menu = signs.sources[entry.source.name]
					return vim_item
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),

				["<Down>"] = cmp.mapping(close_fallback),
				["<Up>"] = cmp.mapping(close_fallback),

				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
			}),


			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		});
	end
}
