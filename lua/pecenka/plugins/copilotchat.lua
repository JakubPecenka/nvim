return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			prompts = {
				Rename = {
					prompt = "Please provide better names for the following variables and functions.",
					mapping = "<leader>Cr",
					description = "Rename Selected Code",
				},
        -- testing possibilities
        Rephrase = {
          system_prompt = "You are very experienced in writing books. Act as a professional writer that wrote not only books but many academic texts as well.",
          prompt = "Please rephrase following text.",
          description = "Rephrase Selected Text",
        },
        Summarize = {
          system_prompt = "You are a professional writer that wrote many books and academic texts. You are very experienced in summarizing texts.",
          prompt = "Please summarize the following text.",
          description = "Summarize Selected Text",
        },
			},
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

