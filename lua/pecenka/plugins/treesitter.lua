return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		-- The main branch has no ensure_installed (setup() only takes install_dir):
		-- install() fetches parsers, skipping the ones already there. Needs the
		-- tree-sitter CLI and a C compiler.
		require("nvim-treesitter").install({
			"bash", "dockerfile", "typescript", "tsx", "javascript", "rust", "go", "css", "html", "swift",
			"python", "java", "sql", "json", "yaml", "toml", "markdown", "markdown_inline",
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
