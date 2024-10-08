local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
  print("error loading lsp config")
  return
end

local opts = {
  on_attach = require("core.lsp.handlers").on_attach,
  capabilities = require("core.lsp.handlers").capabilities,
  lua_ls_opts = require("core.lsp.settings.lua-ls").settings,
  jsonls_opts = require("core.lsp.settings.jsonls").opts,
}

lsp_config.lua_ls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
  settings = opts.lua_ls_opts,
})

lsp_config.bashls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})


lsp_config.gopls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.ts_ls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.tailwindcss.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.solidity_ls_nomicfoundation.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.dockerls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.html.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
  filetypes = { "html", "templ" },
})

lsp_config.cssls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.pyright.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.clangd.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.sqlls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.yamlls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.vimls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})

lsp_config.jsonls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
  opts = opts.jsonls_opts,
})

lsp_config.templ.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
  filetypes = { "templ" },
})

lsp_config.htmx.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
  filetypes = { "html", "templ" },
  cmd = { "htmx-lsp" }
})

lsp_config.somesass_ls.setup({
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})
