require("nvim-web-devicons").setup({
  color_icons = true,
  override_by_extension = {
    ["sol"] = {
      icon = "󰡪",
      name = "ethereum",
    },
    ["templ"] = {
      icon = "",
      name = "goTempl",
    },
    ["vim"] = {
      icon = "",
      name = "vim",
    },
    ["yml"] = {
      icon = "",
      name = "yaml",
    },
    ["yaml"] = {
      icon = "",
      name = "yaml",
    },
    ["d.ts"] = {
      icon = "󰛦",
      name = "definitionTypesctipt",
    },
  },
  override_by_filename = {
    ["tailwind.config.js"] = {
      icon = "󱏿",
      name = "tailwind",
    },
    ["yarn.lock"] = {
      icon = "",
      name = "yarnLocke",
    },
    [".vimrc"] = {
      icon = "",
      name = "vimrc",
    },
    ["makefile"] = {
      icon = "",
      name = "make",
    },
  },
})
