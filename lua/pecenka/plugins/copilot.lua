return {
  "github/copilot.vim",

  config = function()
    vim.g.copilot_filetypes = {markdown = true, yaml = true, json = true, toml = true }

    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-b>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    vim.api.nvim_set_keymap("i", "<A-b>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end
}
