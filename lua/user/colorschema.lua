-- set default colorscheme
local colorscheme = "aurora"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
