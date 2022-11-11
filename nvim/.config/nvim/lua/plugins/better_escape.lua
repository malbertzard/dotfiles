local present, better_escape_setup = pcall(require, "better_escape")
if not present then
  return
end

local better_escape_config = { clear_empty_lines = true }

better_escape_setup.setup(better_escape_config)
