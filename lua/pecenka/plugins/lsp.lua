return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "j-hui/fidget.nvim",
  },

  config = function()
    require("fidget").setup({})
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "black",
        "isort",
      },
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "vtsls",
        "pyright",
        "clangd",
      },
      automatic_installation = true,
    })

    vim.lsp.enable({
      "lua_ls",
      "vtsls",
      "sourcekit",
      "rust_analyzer",
      "clangd",
    })

    -- Native completion (Neovim 0.12+)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method("textDocument/completion") then
          vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

          -- LSP completion lives on the omnifunc; <C-n> only does buffer-keyword
          -- completion. Route <C-n> to LSP completion, or cycle when the menu is open.
          vim.keymap.set("i", "<C-n>", function()
            if vim.fn.pumvisible() == 1 then
              return "<C-n>"
            end
            vim.lsp.completion.get()
            return ""
          end, { buffer = args.buf, expr = true })
        end

        local map = function(keys, func) vim.keymap.set("n", keys, func, { buffer = args.buf }) end
        map("gd", vim.lsp.buf.definition)
        map("gr", vim.lsp.buf.references)
        map("K", vim.lsp.buf.hover)
        map("<leader>rn", vim.lsp.buf.rename)
        map("<leader>ca", vim.lsp.buf.code_action)
      end,
    })
    vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

    vim.diagnostic.config({
      virtual_text = true,
      float = {
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })
  end,
}
