require("core.options")
require("core.plugins_config")
require("core.keymaps")
require("core.colors")
require("core.custom.statusline")
require("core.web_devicons")
require("core.cmp")
require("core.lsp")
require("core.telescope")
require("core.treesitter")
require("core.treesitter_context")
require("core.toggleterm")
require("core.comments")
require("core.git_signs")
require("core.harpoon")
require("core.zen_mode")

P = function(v)
  print(vim.inspect(v))
  return v
end

