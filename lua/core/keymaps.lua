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
keymap("n", "pv", function()
	require("oil").open_float()
end, { desc = "Open Oil in floating window" })
keymap("n", "<leader>pV", ":Oil<CR>", { desc = "Open Oil in current window" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit window" })

-- Clear highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap("n", "sv", ":vsplit<Return>", { desc = "Split window vertically" })
keymap("n", "ss", ":split<Return>", { desc = "Split window horizontally" })
keymap("n", "se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Move window
keymap("n", "sh", "<C-w>h", {desc = "Move focus left"})
keymap("n", "sk", "<C-w>k", {desc = "Move focus up"})
keymap("n", "sj", "<C-w>j", { desc = "Move focus down"})
keymap("n", "sl", "<C-w>l", { desc = "Move focus Right"})

-- Keymaps for Cpp 
keymap("n", "<leader>r", ":terminal g++ % -o /tmp/%:t:r && /tmp/%:t:r <CR>", {desc = "Run cpp program"})

-- Word wrap
keymap("n", "<leader>uw", ":set wrap!<CR>", {desc = "Toogle word wrap"})

-- Toggle Term
keymap("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating Terminal" })

-- Resize splits (w = window)
keymap("n", "wr", ":vertical resize +5<CR>", { desc = "Resize split right" })
keymap("n", "wl", ":vertical resize -5<CR>", { desc = "Resize split left" })
keymap("n", "wk", ":resize +2<CR>", { desc = "Resize split up" })
keymap("n", "wj", ":resize -2<CR>", { desc = "Resize split down" })

-- Rename
keymap("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, { desc = "Rename symbol" })
