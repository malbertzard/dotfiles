local M = {
  'stevearc/overseer.nvim',
  opts = {},
  keys = {
    { "<leader>o", "", desc = "+Overseer" },
    { "<leader>om", "<cmd>Make<cr>", desc = "Make" },
    { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run" },
    { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Info" },
    { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
    { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
  }
}

-- Async :make
vim.api.nvim_create_user_command("Make", function(params)
  -- Insert args at the '$*' in the makeprg
  local cmd, num_subs = vim.o.makeprg:gsub("%$%*", params.args)
  if num_subs == 0 then
    cmd = cmd .. " " .. params.args
  end
  local task = require("overseer").new_task({
    cmd = vim.fn.expandcmd(cmd),
    components = {
      { "on_output_quickfix", open = not params.bang, open_height = 8 },
      "default",
    },
  })
  task:start()
end, {
  desc = "Run your makeprg as an Overseer task",
  nargs = "*",
  bang = true,
})

return M
