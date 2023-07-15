local utils = require("core.utils.functions")
local map = vim.keymap.set

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Better paste
map("v", "p", '"_dP')

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
map("n", "<leader>Ts", "<cmd>SymbolsOutline<cr>", { desc = "Toggle SymbolsOutline" })
map("n", "<leader>TS", "<cmd>windo set scb!<cr>", { desc = "Toggle Scrollbind" })


-- Quickfix List

map("n","<leader>qC",
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

wk.register({
  ["<leader>"] = {
    ["1"] = { "<cmd>:lua require('harpoon.ui').nav_file(1)<cr>", "Jump to Mark 1" },
    ["2"] = { "<cmd>:lua require('harpoon.ui').nav_file(2)<cr>", "Jump to Mark 2" },
    ["3"] = { "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", "Jump to Mark 3" },
    ["4"] = { "<cmd>:lua require('harpoon.ui').nav_file(4)<cr>", "Jump to Mark 4" },
  }
})

-- register non leader based mappings
wk.register({
  sa = "Add surrounding",
  sd = "Delete surrounding",
  sh = "Highlight surrounding",
  sn = "Surround update n lines",
  sr = "Replace surrounding",
  sF = "Find left surrounding",
  sf = "Replace right surrounding",
  st = { "<cmd>lua require('tsht').nodes()<cr>", "TS hint textobject" },
})

-- Register leader based mappings
wk.register({
  b = {
    name = "Buffers",
    D = {
      "<cmd>%bd|e#|bd#<cr>",
      "Close all but the current buffer",
    },
  },
  l = { "LSP" }, -- core.plugins.lsp.keys
  lw = { "Workspaces" }, -- core.plugins.lsp.keys
  f = {
    name = "Files",
  },
  m = {
    name = "Misc",
    l = { "<cmd>source ~/.config/nvim/snippets/*<cr>", "Reload snippets" },
    p = { "<cmd>Lazy check<cr>", "Lazy check" },
  },
  q = {
    name = "Quickfix",
    j = { "<cmd>cnext<cr>", "Next Quickfix Item" },
    k = { "<cmd>cprevious<cr>", "Previous Quickfix Item" },
    q = { "<cmd>lua require('core.utils.functions').toggle_qf()<cr>", "Toggle quickfix list" },
    t = { "<cmd>TodoQuickFix<cr>", "Show TODOs" },
  },
  t = {
    name = "+term",
    v = { "<cmd>vsplit term://bash<cr>", "vSplit Term" },
    s = { "<cmd>split term://bash<cr>", "sSplit Term" },
    T = { "<cmd>term<cr>", "Term" },
    t = { "<cmd>tabnew | term<cr>", "Tab Term" },
  },
  h = {
    name = "+harpoon",
    a = { "<cmd>:lua require('harpoon.mark').add_file()<cr>", "Add Mark" },
    l = { "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", "List Marks" },
    n = { "<cmd>:lua require('harpoon.ui').nav_next()<cr>", "Prev Mark" },
    p = { "<cmd>:lua require('harpoon.ui').nav_prev()<cr>", "Next Mark" },
    ["1"] = { "<cmd>:lua require('harpoon.ui').nav_file(1)<cr>", "Jump to Mark 1" },
    ["2"] = { "<cmd>:lua require('harpoon.ui').nav_file(2)<cr>", "Jump to Mark 2" },
    ["3"] = { "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>", "Jump to Mark 3" },
    ["4"] = { "<cmd>:lua require('harpoon.ui').nav_file(4)<cr>", "Jump to Mark 4" },
    ["5"] = { "<cmd>:lua require('harpoon.ui').nav_file(5)<cr>", "Jump to Mark 5" },
    ["6"] = { "<cmd>:lua require('harpoon.ui').nav_file(6)<cr>", "Jump to Mark 6" },
    ["7"] = { "<cmd>:lua require('harpoon.ui').nav_file(7)<cr>", "Jump to Mark 7" },
    ["8"] = { "<cmd>:lua require('harpoon.ui').nav_file(8)<cr>", "Jump to Mark 8" },
    ["9"] = { "<cmd>:lua require('harpoon.ui').nav_file(9)<cr>", "Jump to Mark 9" },
  },
  T = { name = "Toggles" },
  -- hydra heads
  s = { "Search" },
  w = { "Windows" },
  z = { "Spelling" },
}, { prefix = "<leader>", mode = "n", {} })
