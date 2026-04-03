local M = {}

function M.setup()
	vim.lsp.config("eslint", {
		cmd = { "vscode-eslint-language-server", "--stdio" },

		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
		},

		root_dir = vim.fs.root(0, {
			"eslint.config.mjs",
			"eslint.config.js",
			"package.json",
			"tsconfig.json",
			".eslintrc",
			".eslintrc.js",
			".eslintrc.json",
		}),

		settings = {
			format = false,
			validate = "on",
			workingDirectory = { mode = "auto" },
		},

		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
	})

	-- attach automatically when opening matching files
	-- vim.api.nvim_create_autocmd("FileType", {
	-- 	pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	-- 	callback = function(args)
	-- 		vim.lsp.start(vim.lsp.config.get("eslint"), {
	-- 			bufnr = args.buf,
	-- 		})
	-- 	end,
	-- })
end

return M
