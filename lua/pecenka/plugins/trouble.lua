return {
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        icons = false,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
          -- icons / text used for a diagnostic
          error = "error",
          warning = "warn",
          hint = "hint",
          information = "info"
        },
      })

      vim.keymap.set("n", "<leader>tt", function()
        require("trouble").toggle()
      end)

      vim.keymap.set("n", "<leader>tw", function()
        require("trouble").toggle("workspace_diagnostics")
      end)

      vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)

      vim.keymap.set("n", "]t", function()
        require("trouble").next({skip_groups = true, jump = true});
      end)

      vim.keymap.set("n", "[t", function()
        require("trouble").previous({skip_groups = true, jump = true});
      end)


    end
  },
}
