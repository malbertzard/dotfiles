local M = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  enabled = true,
  opts = {
    enable_check_bracket_line = false, -- Don't add pairs if it already has a close pair in the same line
    ignored_next_char = "[%w%.]",      -- will ignore alphanumeric and `.` symbol
    check_ts = true,                   -- use treesitter to check for a pair.
  },
}

return M
