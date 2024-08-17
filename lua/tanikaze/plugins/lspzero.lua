return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"lukas-reineke/lsp-format.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		local lsp_attach = function(client, bufnr)
			require("lsp-format").on_attach(client, bufnr);
			local opts = { buffer = bufnr, silent = true, noremap = true };
			vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts);
			vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts);
			vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.format()<cr>", opts);
			vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts);
			vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts);
			vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts);
		end
		require("lsp-zero").extend_lspconfig({
			sign_text = { error = "", warn = "", hint = "", info = "" },
			lsp_attach = lsp_attach,
		});

		require("mason").setup();
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({});
			end,
		});
	end
}
