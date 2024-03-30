return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
    'williamboman/mason.nvim',
    build = function()
      pcall(vim.cmd, 'MasonUpdate')
    end
  },
  {'williamboman/mason-lspconfig.nvim'}, -- Optional

  -- Autocompletion
  {'hrsh7th/nvim-cmp'},     -- Required
  {'hrsh7th/cmp-nvim-lsp'}, -- Required
  {'L3MON4D3/LuaSnip'},     -- Required
},

config = function()
  local lsp = require("lsp-zero")

  lsp.preset("recommended")

  lsp.ensure_installed({
    'rust_analyzer',
    'clangd',
    'gopls',
    'pyright',
  })

  -- Fix Undefined global 'vim'
  -- lsp.nvim_workspace()

  -- Fix Undefined global 'vim'
  lsp.configure('lua_ls', {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  })

  lsp.configure('pyright', {
    settings = {
      python = {
        analysis = {
          typeCheckingMode ="strict",
        }
      }
    }
  })


  lsp.set_preferences({
    -- suggest_lsp_servers = false,
    sign_icons = {
      error = 'E',
      warn = 'W',
      hint = 'H',
      info = 'I'
    }
  })


  lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<C-]>", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<A-]>", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<C-[>", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<A-[>", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>c", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>gI", function() vim.lsp.buf.implementations() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>gh", function() vim.lsp.buf.signature_help() end, opts)
  end)

  local cmp = require('cmp')
  cmp.setup({
    mapping = {
      ['<Enter>'] = cmp.mapping.confirm({select=true})
    }
  })


  lsp.setup()


  vim.diagnostic.config({
    virtual_text = true
  })
end
}


