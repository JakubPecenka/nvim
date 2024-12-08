return {
	  'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
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

      vim.keymap.set('n', '<leader>fh', function ()
        builtin.find_files({ hidden = true })
      end)

      vim.keymap.set('n', '<leader>fs', builtin.git_files, {})

      -- find given string in files, project wide
      vim.keymap.set('n', '<leader>fe', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end)

      -- find string under cursor in files, project wide
      vim.keymap.set('n', '<leader>fu', builtin.grep_string, {})

      -- find WORD under cursor in files, project wide
      vim.keymap.set('n', '<leader>fU', function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end)

      -- find given string in files, project wide and respect .gitignore
      vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})

      -- find given string in files and ignore node_modules
      vim.keymap.set('n', '<leader>fn', function()
        builtin.live_grep({ grep_open_files = true, search = vim.fn.input("Grep > "), search_dirs = { '!.git', '!node_modules' } });
      end)

      -- find every occurence of the word under the cursor in the current buffer
      vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

      -- searching for provided string in the current buffer
      vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})

      -- find help for given string
      vim.keymap.set('n', '<leader>ft', builtin.help_tags, {})
  end
}
