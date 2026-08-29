local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

local ensure_installed = {
  "c",
  "go",
  "templ",
  "java",
  "lua",
  "bash",
  "sql",
  "html",
  "css",
  "typescript",
  "javascript",
  "scss",
  "rust",
  "python",
  "vim",
  "vimdoc",
  "query",
  "dockerfile",
  "tsx",
  "ocaml",
  "markdown",
  "markdown_inline",
  "rasi",
}
treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype

    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    local ok_add = pcall(vim.treesitter.language.add, lang)
    if not ok_add then
      return
    end

    pcall(vim.treesitter.start, buf, lang)
  end,
})
