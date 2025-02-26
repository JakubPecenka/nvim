return {
	"danymat/neogen",
	version = "*",
	config = function()
		local neogen = require("neogen")

		neogen.setup({ snippet_engine = "luasnip" })

		vim.keymap.set("n", "<leader>nf", function()
			neogen.generate({
				type = "func",
			})
		end)

		vim.keymap.set("n", "<leader>nF", function()
			neogen.generate({
				type = "file",
			})
		end)

		vim.keymap.set("n", "<leader>nc", function()
			require("neogen").generate({
				type = "class",
			})
		end)

		vim.keymap.set("n", "<leader>nt", function()
			neogen.generate({
				type = "type",
			})
		end)
	end,
}
