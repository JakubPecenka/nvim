return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local refactoring = require("refactoring")
    refactoring.setup()

    vim.keymap.set("x", "<leader>Re", function() refactoring.refactor('Extract Function') end)
    vim.keymap.set("x", "<leader>Rf", function() refactoring.refactor('Extract Function To File') end)
    -- Extract function supports only visual mode
    vim.keymap.set("x", "<leader>Rv", function() refactoring.refactor('Extract Variable') end)
    -- Extract variable supports only visual mode
    vim.keymap.set("n", "<leader>RI", function() refactoring.refactor('Inline Function') end)
    -- Inline func supports only normal
    vim.keymap.set({ "n", "x" }, "<leader>Ri", function() refactoring.refactor('Inline Variable') end)
    -- Inline var supports both normal and visual mode

    vim.keymap.set("n", "<leader>Rb", function() refactoring.refactor('Extract Block') end)
    vim.keymap.set("n", "<leader>Rbf", function() refactoring.refactor('Extract Block To File') end)
    -- Extract block supports only normal mode
  end,
}
