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
theme.font = "JetBrainsMonoNerdFont-Bold"
theme.taglist_font = "JetBrainsMonoNerdFont-Bold 14"
theme.fg_normal = "#a292a3"
theme.fg_focus = "#98BB6C"
theme.bg_normal = "#000000DD"
theme.bg_focus = "#000000DD"
theme.fg_urgent = "#CC9393"
theme.bg_urgent = "#2A1F1E"
theme.border_width = dpi(3)
theme.border_normal = "#00000077"
theme.border_focus = "#F79372"
theme.taglist_fg_focus = "#f9d791"
theme.taglist_fg_urgent = "#E82424"
theme.taglist_bg_focus = "#00000000"
theme.taglist_bg_urgent = "#00000000"
theme.tasklist_fg_focus = "#f9d791"
theme.tasklist_fg_normal = "#9CABCA"
theme.tasklist_bg_focus = "#00000000"
theme.tasklist_bg_normal= "#00000000"
theme.menu_height = dpi(15)
theme.menu_width = dpi(130)
theme.awesome_icon = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel = theme.dir .. "/icons/custom_square_sel.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/custom_square_unsel.png"
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.useless_gap = 0

return theme
