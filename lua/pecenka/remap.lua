-- https://github.com/ThePrimeagen/init.lua/blob/249f3b14cc517202c80c6babd0f9ec548351ec71/lua/theprimeagen/remap.lua
vim.g.mapleader = " "

-- format
vim.keymap.set({ "n", "v" }, "<leader>f=", vim.lsp.buf.format)

-- exit to project
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+y]])

-- turn on copilot
vim.keymap.set("n", "<leader>§§", ":Copilot enable<CR>")

-- open TODO file
vim.keymap.set("n", "<leader>to", ":TodoFile<CR>")

-- to keep in the middle when up-and-downing
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- exit insert mode to normal mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- delete or paste over and keep buffered
vim.keymap.set("x", "<leader>P", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- save by ctr + s
vim.keymap.set("n", "<C-s>", ":w<Enter>")

-- windows adjustments
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])   -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- navigating quickfix list
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "[q", ":cprev<CR>")
vim.keymap.set("n", "<leader>qq", ":copen<CR>")

-- do so
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
