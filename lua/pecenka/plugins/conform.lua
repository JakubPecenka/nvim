return {
  "stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python = { "isort", "black" },
				lua = { "stylua" },
				json = { "prettier" },
				yaml = { "prettier" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				rust = { "rustfmt" },
				go = { "gofumpt", "goimports" },
			},
			rules = {
				{
					width = 80,
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>=", function()
			require("conform").format({
				lsp_format = "fallback",
				timeout = 10000,
				async = true,
			})
		end)
	end,
}
