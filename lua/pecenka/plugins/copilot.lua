return {
	"github/copilot.vim",

	config = function()
		vim.g.copilot_filetypes = { markdown = true, yaml = true, json = true, toml = true }
		vim.keymap.set("n", "<leader>§§", function()
			local output = vim.api.nvim_exec("Copilot status", {})
      if output == "Copilot: Ready" then
        vim.cmd("Copilot disable")
        print("Copilot disabled")
      else
        vim.cmd("Copilot enable")
        print("Copilot enabled")
      end
		end)
	end,
}
