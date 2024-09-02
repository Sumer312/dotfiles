-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

local opts = {
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "single",
    title = " Package Manager ",
    title_pos = "center",
  },
}

local status_plugins_ok, plugins = pcall(require, "core.plugins")
if not status_plugins_ok then
  return
end

return lazy.setup(plugins, opts)
