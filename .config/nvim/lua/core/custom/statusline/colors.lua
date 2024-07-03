local M = {}
function M.colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local color = "%#NormalAccent#"
  if current_mode == "n" then
    color = "%#NormalAccent#"
  elseif current_mode == "i" or current_mode == "ic" then
    color = "%#InsertAccent#"
  elseif current_mode == "niI" then
    color = "%#INormalAccent#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    color = "%#VisualAccent#"
  elseif current_mode == "R" then
    color = "%#ReplaceAccent#"
  elseif current_mode == "c" then
    color = "%#CmdLineAccent#"
  elseif current_mode == "t" then
    color = "%#TerminalAccent#"
  end
  return color
end

function M.inverse_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local inverse_color = "%#NormalInverse#"
  if current_mode == "n" then
    inverse_color = "%#NormalInverse#"
  elseif current_mode == "i" or current_mode == "ic" then
    inverse_color = "%#InsertInverse#"
  elseif current_mode == "niI" then
    inverse_color = "%#INormalInverse#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    inverse_color = "%#VisualInverse#"
  elseif current_mode == "R" then
    inverse_color = "%#ReplaceInverse#"
  elseif current_mode == "c" then
    inverse_color = "%#CmdLineInverse#"
  elseif current_mode == "t" then
    inverse_color = "%#TerminalInverse#"
  end
  return inverse_color
end

function M.black_bg_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local blach_bg_color = "%#NormalBlackBg#"
  if current_mode == "n" then
    blach_bg_color = "%#NormalBlackBg#"
  elseif current_mode == "i" or current_mode == "ic" then
    blach_bg_color = "%#InsertBlackBg#"
  elseif current_mode == "niI" then
    blach_bg_color = "%#INormalBlackBg#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    blach_bg_color = "%#VisualBlackBg#"
  elseif current_mode == "R" then
    blach_bg_color = "%#ReplaceBlackBg#"
  elseif current_mode == "c" then
    blach_bg_color = "%#CmdBlackBg#"
  elseif current_mode == "t" then
    blach_bg_color = "%#TerminalBlackBg#"
  end
  return blach_bg_color
end

return M
