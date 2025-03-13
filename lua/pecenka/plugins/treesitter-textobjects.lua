return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			textobjects = {
				select = {
					enable = true,

          -- -- Automatically jump forward to textobj, similar to targets.vim
          -- lookahead = true,

					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",

						["ac"] = "@class.outer",
						["ic"] = "@class.inner",

            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",

					},
				},
			},
		})
	end,
}
