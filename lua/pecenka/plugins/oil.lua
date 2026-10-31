return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				view_options = {
					show_hidden = true,
				},
				keymaps = {
					["q"] = "actions.close",
				},
			})
		end,
	},
}
