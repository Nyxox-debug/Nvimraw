# Nvimraw

**Note:** Now using vim.lsp and nvim-lspconfig, to change the default configuration of lsp's provided by nvim-lspconfig use the after/lsp folder and also note when changing the default lsp configurations the name should match the nvim-lspconfig name, ie "ts_ls" should also be "ts_ls" in the after/lsp folder

A minimal Neovim config I use as a personal setup.  
It's built with **[lazy.nvim](https://github.com/folke/lazy.nvim)** for plugin management, but kept simple and lightweight.

## Features

- Minimal setup, easy to extend
- Bootstrapped with **lazy.nvim**
- Clean structure for fast startup
- Focused on editing, not bloat

## Installation

Clone this repo into your Neovim config directory:

```bash
git clone https://github.com/Nyxox-debug/nvimraw ~/.config/nvimraw
```

### Using alongside another Neovim config

If you want to use nvimraw as a secondary config without replacing your main setup, add this alias to your `~/.bashrc` (or `~/.zshrc` if using zsh):

```bash
# For nvimraw
alias nvimraw='NVIM_APPNAME=nvimraw nvim'
```

Then reload your shell config:

```bash
source ~/.bashrc
```

Now you can launch this config with `nvimraw` while keeping your main Neovim config intact with the regular `nvim` command.

