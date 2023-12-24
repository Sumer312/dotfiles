local M = {}
function M.update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatuslineAccent#"
  if current_mode == "n" then
    mode_color = "%#StatuslineNormalAccent#"
  elseif current_mode == "i" or current_mode == "ic" then
    mode_color = "%#StatuslineInsertAccent#"
  elseif current_mode == "niI" or current_mode == "ic" then
    mode_color = "%#StatuslineInsertAccent#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    mode_color = "%#StatuslineVisualAccent#"
  elseif current_mode == "R" then
    mode_color = "%#StatuslineReplaceAccent#"
  elseif current_mode == "c" then
    mode_color = "%#StatuslineCmdLineAccent#"
  elseif current_mode == "t" then
    mode_color = "%#StatuslineTerminalAccent#"
  end
  return mode_color
end

function M.update_extra_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local extra_color = "%=%#StatuslineExtra#"
  if current_mode == "n" then
    extra_color = "%=%#StatuslineNormalExtra#"
  elseif current_mode == "i" or current_mode == "ic" then
    extra_color = "%=%#StatuslineInsertExtra#"
  elseif current_mode == "niI" or current_mode == "ic" then
    extra_color = "%#StatuslineInsertAccent#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    extra_color = "%=%#StatuslineVisualExtra#"
  elseif current_mode == "R" then
    extra_color = "%=%#StatuslineReplaceExtra#"
  elseif current_mode == "c" then
    extra_color = "%=%#StatuslineCmdLineExtra#"
  elseif current_mode == "t" then
    extra_color = "%=%#StatuslineTerminalExtra#"
  end
  return extra_color
end

function M.update_lsp_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local lsp_color = "%=%#StatuslineLsp#"
  if current_mode == "n" then
    lsp_color = "%=%#StatuslineNormalLsp#"
  elseif current_mode == "i" or current_mode == "ic" then
    lsp_color = "%=%#StatuslineInsertLsp#"
  elseif current_mode == "niI" or current_mode == "ic" then
    lsp_color = "%#StatuslineInsertAccent#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    lsp_color = "%=%#StatuslineVisualLsp#"
  elseif current_mode == "R" then
    lsp_color = "%=%#StatuslineReplaceLsp#"
  elseif current_mode == "c" then
    lsp_color = "%=%#StatuslineCmdLineLsp#"
  elseif current_mode == "t" then
    lsp_color = "%=%#StatuslineTerminalLsp#"
  end
  return lsp_color
end

function M.update_file_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local extra_color = "%#StatuslineFile#"
  if current_mode == "n" then
    extra_color = "%#StatuslineNormalFile#"
  elseif current_mode == "i" or current_mode == "ic" then
    extra_color = "%#StatuslineInsertFile#"
  elseif current_mode == "niI" or current_mode == "ic" then
    extra_color = "%#StatuslineInsertFile#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    extra_color = "%#StatuslineVisualFile#"
  elseif current_mode == "R" then
    extra_color = "%#StatuslineReplaceFile#"
  elseif current_mode == "c" then
    extra_color = "%#StatuslineCmdLineFile#"
  elseif current_mode == "t" then
    extra_color = "%#StatuslineTerminalFile#"
  end
  return extra_color
end

return M
