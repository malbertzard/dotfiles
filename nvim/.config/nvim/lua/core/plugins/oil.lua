local M = {
  "stevearc/oil.nvim",
  enabled = true,
  lazy = false,
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
    buf_options = {
      buflisted = false,
      bufhidden = "hide",
    },
    win_options = {
      wrap = false,
      signcolumn = "no",
      cursorcolumn = false,
      foldcolumn = "0",
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = "nvic",
    },
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
    skip_confirm_for_simple_edits = false,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>fe", '<cmd>Oil<cr>', desc = "File Explorer" },
  },
}

vim.keymap.set("n", "<leader>fE", function()
  local git_path = vim.fn.finddir(".git", ".;")
  local cd_git = vim.fn.fnamemodify(git_path, ":h")
  vim.api.nvim_command(string.format("Oil %s", cd_git))
end, { desc = "File Explorer Git root" })

return M
