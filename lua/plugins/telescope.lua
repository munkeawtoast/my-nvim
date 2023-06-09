-- Telescope fuzzy finding (all the things)
return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
							-- ["<C-n>"] = actions.cycle_history_next,
							-- ["<C-p>"] = actions.cycle_history_prev,
							["<C-n>"] = actions.move_selection_next,
							["<C-p>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
						n = { q = actions.close },
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")

			local map = require("helpers.keys").map
			map("n", "<leader>fr", require("telescope.builtin").oldfiles, "Recently opened")
			map("n", "<leader><space>", require("telescope.builtin").buffers, "Open buffers")
			map("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, "Search in current buffer")

			map("n", "<leader>ff", require("telescope.builtin").find_files, "Files")
			map("n", "<leader>fh", require("telescope.builtin").help_tags, "Find Help")
			map("n", "<leader>fw", require("telescope.builtin").live_grep, "Find words")
			map("n", "<leader>fW", function()
				require("telescope.builtin").live_grep({
					additional_args = function(args)
						return vim.list_extend(args, { "--hidden", "--no-ignore" })
					end,
				})
			end, "Find words in all files")
			map("n", "<leader>fd", require("telescope.builtin").diagnostics, "Diagnostics")

			map("n", "<C-p>", require("telescope.builtin").keymaps, "Search keymaps")
		end,
	},
}
