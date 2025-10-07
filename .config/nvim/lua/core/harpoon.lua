local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end
-- REQUIRED
harpoon:setup()
-- REQUIRED

local opts = {
  title = " Harpoon ",
  title_pos = "center",
  border = "single",
  ui_fallback_width = 69,
  ui_width_ratio = 0.4,
}

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<A-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), opts) end)

vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<A-n>", function() harpoon:list():next() end)
