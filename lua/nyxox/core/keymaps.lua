-- Leader key
vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Exit insert mode with jj
keymap("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

-- Normal mode mappings
keymap("n", "<leader>o", ":update<CR> :source<CR>", { desc = "Save file and reload config" })
keymap("n", "<leader>pv", function()
	require("oil").open_float()
end, { desc = "Open Oil in floating window" })
keymap("n", "<leader>pV", ":Oil<CR>", { desc = "Open Oil in current window" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit window" })

-- Clear highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>ss", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Move between windows
keymap("n", "sh", "<C-w>h", { desc = "Move to left split" })
keymap("n", "sj", "<C-w>j", { desc = "Move to below split" })
keymap("n", "sk", "<C-w>k", { desc = "Move to above split" })
keymap("n", "sl", "<C-w>l", { desc = "Move to right split" })

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

-- LSP management
keymap("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "Show LSP info" })
keymap("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })
keymap("n", "<leader>ls", "<cmd>LspStart<CR>", { desc = "Start LSP" })
keymap("n", "<leader>lS", "<cmd>LspStop<CR>", { desc = "Stop LSP" })

-- Auto Save Session
keymap("n", "<leader>rr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
keymap("n", "<leader>rs", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })

-- C++ compile and run
keymap("n", "<leader>r", ":!g++ % -o %:r && ./%:r<CR>", { desc = "Compile and run current C++ file" })
