local M = {}

function M.setup()
  local lspconfig = require("lspconfig")

  lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
      -- optional: auto-fix on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  })
end

return M
