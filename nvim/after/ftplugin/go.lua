local settings = require("core.settings")

local vo = vim.opt_local
vo.tabstop = 4
vo.shiftwidth = 4
vo.softtabstop = 4

if settings.enable_dap then
  require("core.plugins.dap.dap").setup()
end
