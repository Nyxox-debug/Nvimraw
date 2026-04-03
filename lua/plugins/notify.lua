return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    notify.setup({
      stages = "fade_in_slide_out",
      timeout = 2500,
      render = "compact",
      top_down = false,
      background_colour = "#000000",
      max_width = 50,
    })

    vim.notify = notify

    -- FORCE BLACK & WHITE THEME
    local hl = vim.api.nvim_set_hl

    hl(0, "NotifyERRORBorder", { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyWARNBorder",  { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyINFOBorder",  { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyDEBUGBorder", { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyTRACEBorder", { fg = "#ffffff", bg = "#000000" })

    hl(0, "NotifyERRORIcon", { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyWARNIcon",  { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyINFOIcon",  { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyDEBUGIcon", { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyTRACEIcon", { fg = "#ffffff", bg = "#000000" })

    hl(0, "NotifyERRORTitle", { fg = "#ffffff", bg = "#000000", bold = true })
    hl(0, "NotifyWARNTitle",  { fg = "#ffffff", bg = "#000000", bold = true })
    hl(0, "NotifyINFOTitle",  { fg = "#ffffff", bg = "#000000", bold = true })
    hl(0, "NotifyDEBUGTitle", { fg = "#ffffff", bg = "#000000", bold = true })
    hl(0, "NotifyTRACETitle", { fg = "#ffffff", bg = "#000000", bold = true })

    hl(0, "NotifyERRORBody", { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyWARNBody",  { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyINFOBody",  { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyDEBUGBody", { fg = "#ffffff", bg = "#000000" })
    hl(0, "NotifyTRACEBody", { fg = "#ffffff", bg = "#000000" })
  end,
}
