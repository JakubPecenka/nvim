function ColorMyPencils(color)
	--color = color or "tokyonight"
	color = color or "gruvbox"
  vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end


return {
  { "ellisonleao/gruvbox.nvim", 
    name = 'gruvbox',
    config = function()
      require('gruvbox').setup({
        -- disable_background = true,
        contrast = "hard", -- canbe "hard", "soft" or empty string
      })

      vim.cmd("colorscheme gruvbox")

      ColorMyPencils()
    end
  },
  { "folke/tokyonight.nvim",
    name = 'tokyonight',
    config = function()
      require('tokyonight').setup({
        style = "night",
        disable_background = true
      })

      --vim.cmd("colorscheme tokyonight")
      --ColorMyPencils()
    end
  },
}
