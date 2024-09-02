local M = {}

M.modes = {
  ['n']     = 'Normal',
  ['niI']   = 'Insert (Normal)',
  ['niR']   = 'Normal',
  ['niV']   = 'Normal',
  ['nt']    = 'Normal',
  ['ntT']   = 'Normal',
  ['v']     = 'Visual',
  ['vs']    = 'Visual',
  ['V']     = 'V-Line',
  ['Vs']    = 'V-Line',
  ['\22']   = 'V-Block',
  ['\22s']  = 'V-Block',
  ['s']     = 'Select',
  ['S']     = 'S-Line',
  ['\19']   = 'S-Block',
  ['i']     = 'Insert',
  ['ic']    = 'Insert',
  ['ix']    = 'Insert',
  ['R']     = 'Replace',
  ['Rc']    = 'Replace',
  ['Rx']    = 'Replace',
  ['Rv']    = 'V-Replace',
  ['Rvc']   = 'V-Replace',
  ['Rvx']   = 'V-Replace',
  ['c']     = 'Command',
  ['cv']    = 'Ex',
  ['ce']    = 'Ex',
  ['r']     = 'Replace',
  ['rm']    = 'More',
  ['r?']    = 'Confirm',
  ['!']     = 'Shell',
  ['t']     = 'Terminal',
}

function M.get_mode()
  local current_mode = vim.api.nvim_get_mode().mode
  if M.modes[current_mode] == nil then
    return current_mode
  end
  return string.format("  %s ", M.modes[current_mode])
end

return M
