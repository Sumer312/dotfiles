local palatte = require("core.theme_colors")
local nvim_web_devicons = require("nvim-web-devicons")

local current_icons = nvim_web_devicons.get_icons()
local new_icons = {}

local color = palatte.sakuraPink
local cterm_color = 198
for key, icon in pairs(current_icons) do
  icon.color = color
  icon.cterm_color = cterm_color
  new_icons[key] = icon
end

nvim_web_devicons.set_icon(new_icons)
