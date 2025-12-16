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
keymap("n", "<leader>w", "<C-w>w", { desc = "Jump to next window" }) -- This is mostly for Shift + k, Lsp Hover

-- Move window
keymap("n", "sh", "<C-w>h", {desc = "Move focus left"})
keymap("n", "sk", "<C-w>k", {desc = "Move focus up"})
keymap("n", "sj", "<C-w>j", { desc = "Move focus down"})
keymap("n", "sl", "<C-w>l", { desc = "Move focus Right"})

-- Keymap for Nasm
keymap("n", "<leader>g", ":terminal nasm -felf64 % <CR>", {desc = "Run asm program"})

-- Keymaps for C/Cpp
-- Run without arguments
keymap("n", "<leader>r", function()
  local filetype = vim.bo.filetype
  
  if filetype == 'cpp' or filetype == 'c' then
    local root_dir = vim.fn.getcwd()
    local build_dir = root_dir .. '/build'
    
    if vim.fn.filereadable(root_dir .. '/CMakeLists.txt') == 1 then
      -- Read CMakeLists.txt to find executable name
      local cmake_content = vim.fn.readfile(root_dir .. '/CMakeLists.txt')
      local exec_name = nil
      
      for _, line in ipairs(cmake_content) do
        local match = line:match('add_executable%((%w+)')
        if match then
          exec_name = match
          break
        end
      end
      
      exec_name = exec_name or vim.fn.fnamemodify(root_dir, ':t')
      
      local cmake_commands = string.format(
        'mkdir -p %s && cd %s && cmake .. && cmake --build . && ./%s',
        build_dir,
        build_dir,
        exec_name
      )
      vim.cmd('terminal ' .. cmake_commands)
    else
      -- Fall back to single-file compilation
      local filename = vim.fn.expand('%')
      local output = '/tmp/' .. vim.fn.expand('%:t:r')
      
      if filetype == 'cpp' then
        vim.cmd('terminal g++ ' .. filename .. ' -o ' .. output .. ' && ' .. output)
      elseif filetype == 'c' then
        vim.cmd('terminal gcc ' .. filename .. ' -o ' .. output .. ' && ' .. output)
      end
    end
  else
    print('Not a C/C++ file')
  end
end, {desc = "Run C/C++ program or CMake project"})

-- Run with arguments
keymap("n", "<leader>R", function()
  local filetype = vim.bo.filetype
  
  if filetype == 'cpp' or filetype == 'c' then
    local root_dir = vim.fn.getcwd()
    local build_dir = root_dir .. '/build'
    
    -- Prompt for arguments
    local args = vim.fn.input('Arguments: ')
    
    if vim.fn.filereadable(root_dir .. '/CMakeLists.txt') == 1 then
      -- Read CMakeLists.txt to find executable name
      local cmake_content = vim.fn.readfile(root_dir .. '/CMakeLists.txt')
      local exec_name = nil
      
      for _, line in ipairs(cmake_content) do
        local match = line:match('add_executable%((%w+)')
        if match then
          exec_name = match
          break
        end
      end
      
      exec_name = exec_name or vim.fn.fnamemodify(root_dir, ':t')
      
      local cmake_commands = string.format(
        'mkdir -p %s && cd %s && cmake .. && cmake --build . && ./%s %s',
        build_dir,
        build_dir,
        exec_name,
        args
      )
      vim.cmd('terminal ' .. cmake_commands)
    else
      -- Fall back to single-file compilation
      local filename = vim.fn.expand('%')
      local output = '/tmp/' .. vim.fn.expand('%:t:r')
      
      if filetype == 'cpp' then
        vim.cmd('terminal g++ ' .. filename .. ' -o ' .. output .. ' && ' .. output .. ' ' .. args)
      elseif filetype == 'c' then
        vim.cmd('terminal gcc ' .. filename .. ' -o ' .. output .. ' && ' .. output .. ' ' .. args)
      end
    end
  else
    print('Not a C/C++ file')
  end
end, {desc = "Run C/C++ program with arguments"})

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

-- Reload nvim
vim.keymap.set("n", "<leader>so", ":luafile $MYVIMRC<CR>", { desc = "Source init.lua" })

-- Flutter
keymap("n", "<leader>fR", "<cmd>FlutterRun<CR>", { desc = "Run Flutter Project" })
keymap("n", "<leader>fr", "<cmd>FlutterReload<CR>", { desc = "Reload Flutter Project" })
keymap("n", "<leader>fq", "<cmd>FlutterQuit<CR>", { desc = "Quit Flutter Project" })
