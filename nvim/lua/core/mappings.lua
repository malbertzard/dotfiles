local utils = require("core.utils.functions")

-- better indenting
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Move Lines
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "q:", "")

-- Better paste
vim.keymap.set("v", "p", '"_dP')

-- Remove Man
vim.keymap.set("n", "K", '')

-- Cancel search highlighting with ESC
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear hlsearch and ESC" })

-- toggles
vim.keymap.set("n", "<leader>mTh", function()
  utils.notify("Toggling hidden chars", vim.log.levels.INFO, "core.mappings")
  vim.o.list = vim.o.list == false and true or false
end, { desc = "Toggle hidden chars" })

vim.keymap.set("n", "<leader>mTl", function()
  utils.notify("Toggling signcolumn", vim.log.levels.INFO, "core.mappings")
  vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
end, { desc = "Toggle signcolumn" })

vim.keymap.set("n", "<leader>mTv", function()
  utils.notify("Toggling virtualedit", vim.log.levels.INFO, "core.mappings")
  vim.o.virtualedit = vim.o.virtualedit == "all" and "block" or "all"
end, { desc = "Toggle virtualedit" })

vim.keymap.set("n", "<leader>mTs", function()
  utils.notify("Toggling spell", vim.log.levels.INFO, "core.mappings")
  vim.o.spell = vim.o.spell == false and true or false
end, { desc = "Toggle spell" })

vim.keymap.set("n", "<leader>mTw", function()
  utils.notify("Toggling wrap", vim.log.levels.INFO, "core.mappings")
  vim.o.wrap = vim.o.wrap == false and true or false
end, { desc = "Toggle wrap" })

vim.keymap.set("n", "<leader>mTc", function()
  utils.notify("Toggling cursorline", vim.log.levels.INFO, "core.mappings")
  vim.o.cursorline = vim.o.cursorline == false and true or false
end, { desc = "Toggle cursorline" })

vim.keymap.set(
  "n",
  "<leader>mTo",
  "<cmd>lua require('core.utils.functions').toggle_colorcolumn()<cr>",
  { desc = "Toggle colorcolumn" }
)


-- Quickfix List
vim.keymap.set("n", "<leader>QC",
  function()
    vim.fn.setqflist({})
  end,
  { desc = "Clear Quickfix List" }
)

vim.keymap.set("n", "<leader>bD", ":%bd|e#|bd#", { desc = "Close all but the current buffer" })

-- Terminal --
-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
