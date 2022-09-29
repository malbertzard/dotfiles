local opts = { silent = true, buffer = 0 }
local keymap = vim.keymap.set

local status_ok, glow = pcall(require, "glow")
if not status_ok then
  return
end

glow.setup({
  style = "dark",
  width = 400,
})

keymap("n","<leader>Mg", ":Glow<CR>", opts)
keymap("n","<leader>Mm", ":MdEval<CR>", opts)
keymap("n","<leader>Me", ":lua require('femaco.edit').edit_code_block()<CR>", opts)
