return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup()

		vim.keymap.set("n", "<leader>gb", function()
			gitsigns.blame_line({ full = true })
		end, { desc = "Gitsigns: blame current line (with diff)" })

		vim.keymap.set("n", "<leader>gB", gitsigns.toggle_current_line_blame,
			{ desc = "Gitsigns: toggle inline blame" })

		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then return "]c" end
			vim.schedule(gitsigns.next_hunk)
			return "<Ignore>"
		end, { expr = true, desc = "Next hunk" })

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then return "[c" end
			vim.schedule(gitsigns.prev_hunk)
			return "<Ignore>"
		end, { expr = true, desc = "Previous hunk" })
	end,
}
