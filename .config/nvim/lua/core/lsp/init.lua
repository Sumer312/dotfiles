vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

require("core.lsp.lsp-config")
require("core.lsp.mason")
require("core.lsp.handlers").setup()
require("core.lsp.none_ls")
