local servers = {
  "lua_ls",
  "sqlls",
  "bashls",
  "jsonls",
  "clangd",
  "gopls",
  "templ",
  "html",
}

local settings = {
  ui = {
    border = "single",
    width = 0.8,
    height = 0.8,
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})
