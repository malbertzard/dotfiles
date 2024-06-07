local settings = require("core.settings")

if not settings.enable_db then
  return {}
end

local M = {
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-completion",
  "kristijanhusak/vim-dadbod-ui",
}


return M
