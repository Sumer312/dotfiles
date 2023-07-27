local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
	return
end
wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		highlights = { border = "FloatBorder" },
		border = "rounded",
	}))
)

wilder.setup({ modes = { ":", "?" } })
