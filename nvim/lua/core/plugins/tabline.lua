return {
  'crispgm/nvim-tabline',
  opts = {
    config = {
      show_index = false,        -- show tab index
      show_modify = true,       -- show buffer modification indicator
      show_icon = true,        -- show file extension icon
      modify_indicator = '', -- modify indicator
      no_name = 'No name',      -- no name buffer name
      brackets = { '', '' },  -- file name brackets surrounding
    },
  }
}

