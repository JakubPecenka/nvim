return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "pylint" },
			java = { "checkstyle" },
			lua = { "luacheck" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
			javascriptreact = { "eslint" },
			rust = { "cargo" },
		}


        local checkstyle = require("lint.linters.checkstyle")

        checkstyle.config = {
            filetypes = { "java" },
            cmd = "checkstyle",
            args = { "-c", "~/.config/nvim/checkstyle.xml", "%f" },
            stream = "stderr",
            parser = require("lint.parser").from_errorformat("%f:%l:%c: %m"),
            config_file = "~/.config/nvim/checkstyle.xml",
        }

		-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		--
		-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		--   group = lint_augroup,
		--   callback = function()
		--     lint.try_lint()
		--   end,
		-- })

		vim.keymap.set("n", "<leader>l", function()
			print("linting")
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
