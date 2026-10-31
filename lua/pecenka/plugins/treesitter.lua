return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "bash", "dockerfile", "typescript", "javascript", "rust", "go", "css", "html", "swift" },
		})

		-- Auto-update parsers when Neovim version changes (e.g. after brew upgrade)
		local v = vim.version()
		local ver = ("%d.%d.%d"):format(v.major, v.minor, v.patch)
		local ver_file = vim.fn.stdpath("data") .. "/ts_nvim_version"
		local last = vim.fn.filereadable(ver_file) == 1 and vim.fn.readfile(ver_file)[1] or nil
		if last ~= ver then
			vim.fn.writefile({ ver }, ver_file)
			vim.cmd("TSUpdate")
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
