return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    vim.g.vimtex_view_method = 'general'
    vim.g.vimtex_view_general_viewer = 'open'
    vim.g.vimtex_view_general_options = ''

    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      executable = 'docker-latex',
      options = {
        -- '-xelatex',
        '-pdf',
        -- '-interaction=nonstopmode',
        -- '-synctex=1',
      }
    }

  end
}

