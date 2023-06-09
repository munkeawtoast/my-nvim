local map = require("helpers.keys").map

-- Blazingly fast way out of insert mode
map("i", "jj", "<esc>")
map("i", "jk", "<esc>")
map("i", "kk", "<esc>")



-- Diagnostic keymaps
map('n', 'gx', vim.diagnostic.open_float, "Show diagnostics under cursor")

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")


-- Deleting buffers
local buffers = require("helpers.buffers")
map("n", "<leader>c", buffers.delete_this, "Current buffer")
map("n", "<leader>bc", buffers.delete_others, "Other buffers")
map("n", "<leader>bC", buffers.delete_all, "All buffers")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Switch between light and dark modes
map("n", "<leader>ut", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, "Toggle between light and dark themes")
