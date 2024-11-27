return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
            function ()
                require("trouble").toggle({mode = "diagnostics"})
            end,
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>tT",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>ts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>tl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>tL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>tq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{
			"[t",
			"<cmd>Trouble diagnostics prev<cr><cmd>Trouble diagnostics jump<cr>",
			desc = "Previous (Trouble)",
		},
		{
			"]t",
			"<cmd>Trouble diagnostics next<cr><cmd>Trouble diagnostics jump<cr>",
			desc = "Next (Trouble)",
		},
	},
}
