--[[

     Blackburn Awesome WM theme 3.0
     github.com/lcpz

--]]

--[[ local gears = require("gears") ]]
--[[ local lain = require("lain") ]]
--[[ local awful = require("awful") ]]
--[[ local wibox = require("wibox") ]]
--[[ local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility ]]

local dpi = require("beautiful.xresources").apply_dpi

local os = os

local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/blackburn"
theme.wallpaper = theme.dir .. "/wall.png"
theme.font = "JetBrainsMonoNerdFont-Bold"
theme.taglist_font = "JetBrainsMonoNerdFont-Bold 13"
theme.fg_normal = "#f9d791"
theme.fg_focus = "#98BB6C"
theme.bg_normal = "#000000"
theme.bg_focus = "#000000"
theme.fg_urgent = "#CC9393"
theme.bg_urgent = "#2A1F1E"
theme.border_width = dpi(2)
theme.border_normal = "#0E0E0E"
theme.border_focus = "#F79372"
theme.taglist_fg_focus = "#98BB6C"
theme.taglist_bg_focus = "#000000"
theme.tasklist_fg_focus = "#98BB6C"
theme.tasklist_fg_normal = "#f9d791"
theme.tasklist_bg_focus = "#000000"
theme.menu_height = dpi(16)
theme.menu_width = dpi(130)
theme.awesome_icon = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel = theme.dir .. "/icons/custom_square_sel.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/custom_square_unsel.png"
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.useless_gap = 0

return theme
