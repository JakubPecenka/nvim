require("pecenka.remap")
require("pecenka.set")
require("pecenka.lazy")

local augroup = vim.api.nvim_create_augroup
local mygroup = augroup('mygroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = mygroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        -- vim.keymap.set("n", "<C-]>", function() vim.diagnostic.goto_next() end, opts)
        -- vim.keymap.set("n", "<C-[>", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>c", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>gI", function() vim.lsp.buf.implementations() end, opts)
        vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
      end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.api.nvim_create_user_command(
    "PopulateQuickfix",
    function ()
      local files = vim.fn.glob(vim.fn.expand("%:p:h") .. "/*", false, true)
      vim.fn.setqflist({}, "r")

      local entries = {}
      for _, file in ipairs(files) do
          if vim.fn.isdirectory(file) == 0 then
              table.insert(entries, { filename = file })
          end
      end
      vim.fn.setqflist(entries, "r")
      vim.cmd("copen")
    end,
    { desc = "Populate quickfix list with files in current directory" }
)

vim.api.nvim_create_user_command(
  "TodoFile",
  function()
    -- get root directory of neovim project
    local root = vim.fn.getcwd()

    -- if TODO.md exists, open it
    -- otherwise, create it and open it

    local todo_file = root .. "/TODO.md"

    if vim.fn.filereadable(todo_file) == 1 then
      vim.cmd("e " .. todo_file)
    else
      vim.cmd("e " .. todo_file)
      vim.fn.append(0, "# TODO")
      vim.cmd("w")
    end

  end,
  { desc = "Open TODO.md file." }
)
