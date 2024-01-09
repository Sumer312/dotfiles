local M = {}
function M.setup()
  vim.filetype.add({
    extension = {
      templ = "templ",
    },
  })
end

return M
