local M = {}

function M.setup()
  local lspconfig = require("lspconfig")

  lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
      -- ❌ disable formatting (important so it doesn't interfere with other formatters)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,

    settings = {
      format = false,
      validate = "on",
      workingDirectory = { mode = "auto" },
    },
  })
end

return M
