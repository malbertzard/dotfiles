local M = {
  "subnut/nvim-ghost.nvim"
}
vim.cmd([[
  augroup nvim_ghost_user_autocommands
    autocmd User www.reddit.com,www.stackoverflow.com setfiletype markdown
    autocmd User www.reddit.com,www.github.com setfiletype markdown
    autocmd User github.com setfiletype markdown
  augroup END
]])

vim.g.nvim_ghost_autostart = 0

return M
