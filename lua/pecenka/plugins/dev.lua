return {
  {
    dir = "~/.dev/nvimpackages/myutils.nvim",
    dev = true,
    config = function()
      require("myutils").setup()
    end,
  },
}

