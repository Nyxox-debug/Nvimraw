vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Exit insert mode with jj
keymap("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

-- Tab management
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Select all
keymap("n", "<C-a>", "ggVG", { desc = "Select all text in buffer" })

-- Lazy plugin manager
keymap("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Open Lazy plugin manager" })

-- Format file using LSP
keymap("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format current buffer" })

-- Delete a word backwards
keymap("n", "dw", 'vb"_d')

-- Normal mode mappings
keymap("n", "<leader>o", ":update<CR> :source<CR>", { desc = "Save file and reload config" })
keymap("n", "<leader>pv", function()
	require("oil").open_float()
end, { desc = "Open Oil in floating window" })
keymap("n", "<leader>pV", ":Oil<CR>", { desc = "Open Oil in current window" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit window" })

-- Clear highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>ss", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
