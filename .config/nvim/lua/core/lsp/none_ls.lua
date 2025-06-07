local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  print("error loading none ls")
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.cbfmt,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.sqlfmt,
    null_ls.builtins.formatting.gofmt,
  },
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
vim.lsp.buf.format({ timeout_ms = 2000 })
