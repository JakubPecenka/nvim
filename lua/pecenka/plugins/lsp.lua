return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "j-hui/fidget.nvim",

    -- Completion (choose one approach below)
    -- Option A: Keep nvim-cmp for richer completion experience
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },

  config = function()
    -- ============================================================
    -- Mason setup (for installing LSP servers and tools)
    -- ============================================================
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
        "ty",
      },
      -- Automatic setup is disabled - we use native vim.lsp.enable()
      automatic_installation = true,
    })

    -- ============================================================
    -- Native vim.lsp configuration (Neovim 0.11+)
    -- ============================================================

    -- Global LSP config applied to all servers
    vim.lsp.config("*", {
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    })

    -- Enable LSP servers (configs are in ~/.config/nvim/lsp/*.lua)
    vim.lsp.enable({
      "lua_ls",
      "vtsls",
      "ty",
      "sourcekit",
      "rust_analyzer",
    })

    -- ============================================================
    -- Completion setup (Option A: nvim-cmp)
    -- ============================================================
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
        ["<C-p>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item({ behavior = "insert" })
          else
            cmp.complete()
          end
        end),
        ["<C-n>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = "insert" })
          else
            cmp.complete()
          end
        end),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })

    -- ============================================================
    -- Option B: Native completion (uncomment to use instead of nvim-cmp)
    -- Remove nvim-cmp dependencies above if using this
    -- ============================================================
    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   callback = function(args)
    --     local client = vim.lsp.get_client_by_id(args.data.client_id)
    --     if client and client:supports_method("textDocument/completion") then
    --       vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    --     end
    --   end,
    -- })
    --
    -- -- For native completion, you might want these settings:
    -- vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
    -- -- Use <C-n>/<C-p> to navigate, <C-y> to confirm

    -- ============================================================
    -- Diagnostics configuration
    -- ============================================================
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
