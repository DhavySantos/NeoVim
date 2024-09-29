return {
	"mfussenegger/nvim-dap",
	event = "BufEnter",

	keys = {
		{ "<leader>db", "<cmd> DapToggleBreakpoint <cr>", mode = { "n" }, desc = "Toggle Breakpoint" },
		{ "<leader>dt", "<cmd> DapTerminate <cr>",        mode = { "n" }, desc = "Terminate Debug Session " },
		{ "<leader>dp", "<cmd> DapContinue <cr>",         mode = { "n" }, desc = "Resume Debug" },
		{ "<leader>ds", "<cmd> DapStepOver <cr>",         mode = { "n" }, desc = "Dap Step Over" },
		{ "<leader>dn", "<cmd> DapNew <cr>",              mode = { "n" }, desc = "New Debug Session" },
	},

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		local dap = require("dap");
		require("dapui").setup();

		dap.adapters.codelldb = {
			port = 13000,
			type = 'server',
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb",
				args = { "--port", "13000" },
			},
		}

		dap.listeners.after.event_initialized["dapui_config"] = function()
			require("dapui").open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			require("dapui").close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			require("dapui").close()
		end
	end
}
