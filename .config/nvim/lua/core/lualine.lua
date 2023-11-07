local palette = require("core.theme_colors")
local custom_theme = {}

custom_theme.normal = {
  a = { bg = palette.autumnYellow, fg = palette.dragonBlack0, gui = "bold" },
  b = { bg = palette.dragonBlack0, fg = palette.autumnYellow },
  c = { bg = "none", fg = palette.autumnYellow, gui = "bolditalic" },
}

custom_theme.insert_ctrl_o = {
  a = { bg = palette.waveAqua3, fg = palette.dragonBlack0, gui = "bold" },
  b = { bg = palette.dragonBlack0, fg = palette.waveAqua3 },
  c = { bg = "none", fg = palette.waveAqua3, gui = "bolditalic" },
}
custom_theme.terminal = {
  a = { bg = palette.samuraiRed, fg = palette.dragonBlack0, gui = "bold" },
  b = { bg = palette.dragonBlack0, fg = palette.samuraiRed },
  c = { bg = "none", fg = palette.samuraiRed, gui = "bolditalic" },
}

custom_theme.insert = {
  a = { bg = palette.springGreen, fg = palette.dragonBlack0, gui = "bold" },
  b = { bg = palette.dragonBlack0, fg = palette.springGreen },
  c = { bg = "none", fg = palette.springGreen, gui = "bolditalic" },
}

custom_theme.command = {
  a = { bg = palette.springBlue, fg = palette.dragonBlack0, gui = "bold" },
  b = { bg = palette.dragonBlack0, fg = palette.springBlue },
  c = { bg = "none", fg = palette.springBlue, gui = "bolditalic" },
}

custom_theme.visual = {
  a = { bg = palette.dragonPink, fg = palette.dragonBlack0, gui = "bold" },
  b = { bg = palette.dragonBlack0, fg = palette.dragonPink },
  c = { bg = "none", fg = palette.dragonPink, gui = "bolditalic" },
}

custom_theme.replace = {
  a = { bg = palette.waveRed, fg = palette.dragonBlack0, gui = "bold" },
  b = { bg = palette.dragonBlack0, fg = palette.waveRed },
  c = { bg = "none", fg = palette.waveRed, gui = "bolditalic" },
}

custom_theme.inactive = {
  a = { bg = palette.autumnYellow, fg = palette.dragonBlack0, gui = "bold" },
  b = { bg = palette.dragonBlack0, fg = palette.autumnYellow },
  c = { bg = "none", fg = palette.autumnYellow },
}

require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = custom_theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 3 } },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})
