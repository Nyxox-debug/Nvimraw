return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- for lazy updates count

    -- Black & Red theme tuned for rose-pine
    local colors = {
      red         = "#eb6f92", -- rose-pine red
      dark_red    = "#b4637a",
      black       = "#191724", -- rose-pine darkest background
      gray        = "#6e6a86", -- subtle text
      light_gray  = "#e0def4", -- lighter text
      accent_gray = "#26233a", -- slightly lighter than black for contrast
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.red, fg = colors.black, gui = "bold" },
        b = { bg = colors.accent_gray, fg = colors.light_gray },
        c = { bg = colors.black, fg = colors.light_gray },
      },
      insert = {
        a = { bg = "#31748f", fg = colors.black, gui = "bold" }, -- teal from rose-pine
        b = { bg = colors.accent_gray, fg = colors.light_gray },
        c = { bg = colors.black, fg = colors.light_gray },
      },
      visual = {
        a = { bg = "#c4a7e7", fg = colors.black, gui = "bold" }, -- lavender
        b = { bg = colors.accent_gray, fg = colors.light_gray },
        c = { bg = colors.black, fg = colors.light_gray },
      },
      command = {
        a = { bg = "#f6c177", fg = colors.black, gui = "bold" }, -- gold
        b = { bg = colors.accent_gray, fg = colors.light_gray },
        c = { bg = colors.black, fg = colors.light_gray },
      },
      replace = {
        a = { bg = colors.dark_red, fg = colors.black, gui = "bold" },
        b = { bg = colors.accent_gray, fg = colors.light_gray },
        c = { bg = colors.black, fg = colors.light_gray },
      },
      inactive = {
        a = { bg = colors.black, fg = colors.gray, gui = "bold" },
        b = { bg = colors.black, fg = colors.gray },
        c = { bg = colors.black, fg = colors.gray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.red },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
