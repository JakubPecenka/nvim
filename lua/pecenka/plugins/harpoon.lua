return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function ()
    local harpoon = require("harpoon")
    harpoon:setup()
    vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- using C-2 doesn't work as i use C-space for tmux prefix
    -- https://www.reddit.com/r/tmux/comments/103clhv/space_is_now_bound_to_2_for_some_reason/
    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  end
}
