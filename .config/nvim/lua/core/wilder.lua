local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
  return
end
wilder.set_option(
  "renderer",
  wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
    highlights = { border = "FloatBorder" },
    left = { ' ', wilder.popupmenu_devicons() },
    right = { ' ', wilder.popupmenu_scrollbar() },
    border = "single",
  }))
)

wilder.setup({
  next_key = "<C-j>",
  previous_key = "<C-k>",
  modes = { ":", "?" },
})
