local Hydra = require("hydra")
local utils = require("core.utils.functions")

local function cmd(command)
  return table.concat({ "<Cmd>", command, "<CR>" })
end

local hint = [[
 _N_: next                 _P_: previous
 _L_: list suggestions     _f_: use first suggestion
 _A_: add word             _S_: switch spelllang

 ^
 _q_: Exit
]]

Hydra({
  name = "Spelling",
  hint = hint,
  config = {
    color = "pink",
    on_enter = function()
      vim.opt_local.spell = true
      vim.keymap.set("n", "K", "")
    end,
    on_exit = function()
      vim.opt_local.spell = false
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
    end,
    invoke_on_body = true,
    hint = {
      position = "bottom",
    },
  },
  mode = "n",
  body = "<Leader>z",
  heads = {
    { "N", "]s" },
    { "P", "[s" },
    { "A", "zg" },
    { "L", cmd("Telescope spell_suggest") },
    { "S", function()
      utils.switch_spell_lang()
    end },
    { "f", "1z=" },
    { "q", nil,  { exit = true, nowait = true } },
  },
})
