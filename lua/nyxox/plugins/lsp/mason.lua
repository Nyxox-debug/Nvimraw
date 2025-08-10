return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- Web & JS
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"eslint",

				-- Go
				"gopls",

				-- C++
				"clangd",

				-- Rust
				"rust_analyzer",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- General Formatters & Linters
				"prettier", -- JavaScript/TypeScript formatter
				"stylua", -- Lua formatter
				"isort", -- Python import sorter
				"black", -- Python formatter
				"pylint",
				"eslint_d",

				-- Go tools
				"goimports", -- Auto-format imports
				"gofumpt", -- Stricter gofmt
				"golangci-lint", -- Go linter

				-- C++ tools
				"clang-format", -- C/C++ formatter
				"cpplint", -- C++ linter

				-- Rust tools
				"rustfmt", -- Rust formatter
				"codelldb", -- Debug adapter for Rust & C++
			},
		})
	end,
}
