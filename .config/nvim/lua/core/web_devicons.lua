require("nvim-web-devicons").setup({
  color_icons = true,
  override_by_filename = {
    ["yarn.lock"] = {
      icon = "",
      name = "yarnLocke",
    },
    ["makefile"] = {
      icon = "",
      name = "make",
    },
  },
})
