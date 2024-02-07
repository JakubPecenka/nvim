require('gruvbox').setup({
   -- disable_background = true,
   contrast = "hard", -- canbe "hard", "soft" or empty string
})

require('tokyonight').setup({
  style = "night",
  disable_background = true
})

function ColorMyPencils(color)
	--color = color or "tokyonight"
	color = color or "gruvbox"
  vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()

