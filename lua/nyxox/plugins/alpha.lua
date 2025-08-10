return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Set menu

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC pv", "  > Open Oil (floating)", "<cmd>lua require('oil').open_float()<CR>"),
      dashboard.button("SPC pV", "  > Open Oil (current window)", "<cmd>Oil<CR>"),
      dashboard.button("SPC w", "󰆓  > Save File", "<cmd>w<CR>"),
      dashboard.button("SPC q", "  > Quit Window", "<cmd>q<CR>"),
      dashboard.button("SPC to", "  > Open New Tab", "<cmd>tabnew<CR>"),
      dashboard.button("SPC tx", "  > Close Current Tab", "<cmd>tabclose<CR>"),
      dashboard.button("SPC rr", "󰆓  > Restore Previous Session", "<cmd>SessionRestore<CR>"),
      dashboard.button("SPC ll", "󰒲  > Open Lazy Plugin Manager", "<cmd>Lazy<CR>"),
}
    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
