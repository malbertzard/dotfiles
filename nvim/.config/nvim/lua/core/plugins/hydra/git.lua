local Hydra = require("hydra")
local gitsigns = require("gitsigns")

local function cmd(command)
  return table.concat({ "<Cmd>", command, "<CR>" })
end

local hint = [[
 _J_: next hunk    _K_: prev hunk
 _s_: stage hunk   _u_: unstage hunk
 _S_: stage buffer
 _b_: blame line   _B_: blame
^^^^
_q_: exit
]]

local opts = { exit = true, nowait = true }

Hydra({
  hint = hint,
  config = {
    color = "pink",
    invoke_on_body = true,
    hint = {
      position = "bottom",
    },
  },
  mode = { "n", "x" },
  body = "<leader>gM",
  heads = {
    { "s", cmd("Gitsigns stage_hunk") },
    { "S", cmd("Gitsigns stage_buffer") },
    { "u", cmd("Gitsigns undo_stage_hunk") },
    { "J", cmd("Gitsigns next_hunk") },
    { "K", cmd("Gitsigns prev_hunk") },
    { "b", cmd("Gitsigns blame_line") },
    { "B", cmd("Gitsigns blame") },
    { "q", nil, opts },
  },
})
