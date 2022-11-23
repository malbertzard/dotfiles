local color = "catppuccin"

local status_ok, colorschema = pcall(require, color)
if not status_ok then
	return
end
colorschema.setup()

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. color)
if not status_ok then
  return
end
