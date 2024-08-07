return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		local lsp = require("lsp-zero");

		require("mason").setup();
		require("mason-lspconfig").setup_handlers({ function(server)
			require("lspconfig")[server].setup({});
		end });

		vim.diagnostic.config({
			virtual_text = true,
			underline = true,
			signs = false,
		});

		local signs = { Error = "", Warn = "", Hint = "", Info = "" };

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		lsp.setup();
	end
}
