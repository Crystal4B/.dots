return {
	"rcarriga/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-dap-ui",
		"nvim-neotest/nvim-nio",

		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()
		require("dap-go").setup()

		dap.listeners.before.attach.dapui_config = dapui.open
		dap.listeners.before.launch.dapui_config = dapui.open
		dap.listeners.before.event_terminated.dapui_config = dapui.close
		dap.listeners.before.event_exited.dapui_config = dapui.close

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "[D]ap [T]oggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "[D]ap [C]ontinue" })
		vim.keymap.set("n", "<Leader>dd", dap.disconnect, { desc = "[D]ap [D]isconnect" })
	end,
}
