return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
		},
    keys = {
      -- Keybinding to open CopilotChat in normal mode
      { "<leader>Cc", ":CopilotChat<CR>", mode = "n", desc = "Open CopilotChat" },
      -- Keybinding to explain selected code in visual mode
      { "<leader>Ce", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Selected Code" },
      -- Keybinding to review selected suggestions in visual mode
      { "<leader>Cs", ":CopilotChatReview<CR>", mode = "v", desc = "Review Selected Suggestions" },
      -- Keybinding to fix selected code in visual mode
      { "<leader>Cf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Selected Code" },
      -- Keybinding to optimize selected code in visual mode
      { "<leader>Co", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Selected Code" },
      -- Keybinding to generate documentation for selected code in visual mode
      { "<leader>Cd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs for Selected Code" },
      -- Keybinding to generate tests for selected code in visual mode
      { "<leader>Ct", ":CopilotChatTest<CR>", mode = "v", desc = "Generate Tests for Selected Code" },
      -- Keybinding to generate commit message in normal mode
      { "<leader>Cm", ":CopilotChatCommit<CR>", mode = "n", desc = "Generate Commit Message" },

    },
	},
}
