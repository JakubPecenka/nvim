require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      "grep",
      "--extended-regexp",
      "--color=never",
      "--with-filename",
      "--line-number",
      "-b",
      "--ignore-case",
      "--recursive",
    }
  }
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ft', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fe', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

