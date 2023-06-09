-- Miscelaneous fun stuff
return {
	-- Good looking icons
	{
		"yamatsum/nvim-nonicons",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-nonicons").setup({})
		end,
	},
	-- Comment with haste
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	-- smart relative number
	{ "sitiom/nvim-numbertoggle", event = "InsertEnter" },
	-- Better buffer closing actions. Available via the buffers helper.
	{
		"kazhala/close-buffers.nvim",
		opts = {
			preserve_window_layout = { "this", "nameless" },
		},
	},
	"tpope/vim-surround", -- Surround stuff with the ys-, cs-, ds- commands
	{
		"karb94/neoscroll.nvim",
		opts = {
			-- All these keys will be mapped to their corresponding default scrolling animation
			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
			hide_cursor = false, -- Hide cursor while scrolling
			stop_eof = true, -- Stop at <EOF> when scrolling downwards
			respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
			easing_function = "sine", -- Default easing function
			performance_mode = false, -- Disable "Performance Mode" on all buffers.
		},
	},
}
