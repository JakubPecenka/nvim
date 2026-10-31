-- Uses built-in nvim.undotree (Neovim 0.12+)
vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", "<cmd>Undotree<CR>")
return {}
