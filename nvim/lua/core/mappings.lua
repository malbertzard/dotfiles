local utils = require("core.utils.functions")
local map = vim.keymap.set

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "q:", "")

-- Better paste
map("v", "p", '"_dP')

-- Remove Man
map("n", "K", '')

-- Cancel search highlighting with ESC
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear hlsearch and ESC" })

-- toggles
map("n", "<leader>Th", function()
  utils.notify("Toggling hidden chars", vim.log.levels.INFO, "core.mappings")
  vim.o.list = vim.o.list == false and true or false
end, { desc = "Toggle hidden chars" })
map("n", "<leader>Tl", function()
  utils.notify("Toggling signcolumn", vim.log.levels.INFO, "core.mappings")
  vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
end, { desc = "Toggle signcolumn" })
map("n", "<leader>Tv", function()
  utils.notify("Toggling virtualedit", vim.log.levels.INFO, "core.mappings")
  vim.o.virtualedit = vim.o.virtualedit == "all" and "block" or "all"
end, { desc = "Toggle virtualedit" })
map("n", "<leader>Ts", function()
  utils.notify("Toggling spell", vim.log.levels.INFO, "core.mappings")
  vim.o.spell = vim.o.spell == false and true or false
end, { desc = "Toggle spell" })
map("n", "<leader>Tw", function()
  utils.notify("Toggling wrap", vim.log.levels.INFO, "core.mappings")
  vim.o.wrap = vim.o.wrap == false and true or false
end, { desc = "Toggle wrap" })
map("n", "<leader>Tc", function()
  utils.notify("Toggling cursorline", vim.log.levels.INFO, "core.mappings")
  vim.o.cursorline = vim.o.cursorline == false and true or false
end, { desc = "Toggle cursorline" })
map(
  "n",
  "<leader>To",
  "<cmd>lua require('core.utils.functions').toggle_colorcolumn()<cr>",
  { desc = "Toggle colorcolumn" }
)
map("n", "<leader>TS", "<cmd>windo set scb!<cr>", { desc = "Toggle Scrollbind" })


-- Quickfix List

map("n", "<leader>qC",
  function()
    vim.fn.setqflist({})
  end,
  { desc = "Clear Quickfix List" }
)

-- Terminal --
-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h")
map("t", "<C-j>", "<C-\\><C-N><C-w>j")
map("t", "<C-k>", "<C-\\><C-N><C-w>k")
map("t", "<C-l>", "<C-\\><C-N><C-w>l")
map("t", "<Esc>", "<C-\\><C-n>")

local wk = require("which-key")

-- Register leader based mappings
wk.register({
  b = {
    name = "Buffers",
    D = {
      "<cmd>%bd|e#|bd#<cr>",
      "Close all but the current buffer",
    },
  },
  m = {
    name = "Misc",
    s = { "<cmd>source ~/.config/nvim/snippets/*<cr>", "Reload snippets" },
    a = { "<cmd>Alpha<cr>", "Alpha" },
    l = { "<cmd>Lazy<cr>", "Lazy" },
  },
  q = {
    name = "+Quickfix",
    j = { "<cmd>cnext<cr>", "Next Quickfix Item" },
    k = { "<cmd>cprevious<cr>", "Previous Quickfix Item" },
    q = { "<cmd>lua require('core.utils.functions').toggle_qf()<cr>", "Toggle quickfix list" },
    t = { "<cmd>TodoQuickFix<cr>", "Show TODOs" },
  },
  t = {
    name = "+Term",
    v = { "<cmd>vsplit | term<cr>", "vSplit Term" },
    s = { "<cmd>split | term<cr>", "sSplit Term" },
    T = { "<cmd>term<cr>", "Term" },
    t = { "<cmd>tabnew | term<cr>", "Tab Term" },
    h = { "<cmd>tabnew | term htop <cr>", "htop" },
    N = {
      -- Work Intern Tools
      name = "+NDS",
      u = { "<cmd>tabnew | term nds update <cr>", "Up" },
      U = { "<cmd>tabnew | term nds upgrade <cr>", "Upgrade" },
      i = { "<cmd>tabnew | term nds info <cr>", "Info" },
      r = { "<cmd>tabnew | term nds restart <cr>", "Restart" },
      E = { "<cmd>tabnew | term nds enter <cr>", "Enter" },
      S = { "<cmd>tabnew | term nds down <cr>", "Shutdown" },
      D = {
        name = "Database",
        i = { "<cmd>tabnew | term nds db:import <cr>", "Database Import" },
      }
    },
  },

  T = { name = "+Toggles" },
  d = { name = "+DAP" },
  F = { name = "+Filetype" },

  z = { "Spelling" },
}, { prefix = "<leader>", mode = "n", {} })
