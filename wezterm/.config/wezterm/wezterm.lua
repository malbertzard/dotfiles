-- Pull in the wezterm false
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = 'Gruvbox dark, pale (base16)'

config.font_size = 11
config.line_height = 1.0
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false

-- Add these lines:
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    -- You can change the key binding to whatever you want:
    mods = "LEADER",
    key = "r",
    action = require("wez-per-project-workspace.plugin").action.ProjectWorkspaceSelect({
      base_dirs = {
        {
          path = wezterm.home_dir .. "/code",
          min_depth = 0,
          max_depth = 3,
        },
      },
      rooters = { ".git" },
      shorten_paths = false,
    }),
  },

  { key = "a",  mods = "LEADER|CTRL",  action = wezterm.action { SendString = "\x01" } },
  { key = "-",  mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  { key = "\\", mods = "LEADER",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  { key = "s",  mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  { key = "v",  mods = "LEADER",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  { key = "o",  mods = "LEADER",       action = "TogglePaneZoomState" },
  { key = "z",  mods = "LEADER",       action = "TogglePaneZoomState" },
  { key = "c",  mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { key = "h",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
  { key = "j",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
  { key = "k",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
  { key = "l",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
  { key = "H",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
  { key = "J",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
  { key = "K",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
  { key = "L",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
  { key = "1",  mods = "LEADER",       action = wezterm.action { ActivateTab = 0 } },
  { key = "2",  mods = "LEADER",       action = wezterm.action { ActivateTab = 1 } },
  { key = "3",  mods = "LEADER",       action = wezterm.action { ActivateTab = 2 } },
  { key = "4",  mods = "LEADER",       action = wezterm.action { ActivateTab = 3 } },
  { key = "5",  mods = "LEADER",       action = wezterm.action { ActivateTab = 4 } },
  { key = "6",  mods = "LEADER",       action = wezterm.action { ActivateTab = 5 } },
  { key = "7",  mods = "LEADER",       action = wezterm.action { ActivateTab = 6 } },
  { key = "8",  mods = "LEADER",       action = wezterm.action { ActivateTab = 7 } },
  { key = "9",  mods = "LEADER",       action = wezterm.action { ActivateTab = 8 } },
  { key = "&",  mods = "LEADER|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
  { key = "d",  mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },
  { key = "x",  mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },
}

-- tabline
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'GruvboxDark',
    color_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
  },
  sections = {
    tabline_a = {},
    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tab_active = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = {},
    tabline_y = { 'datetime', 'battery' },
    tabline_z = { 'hostname' },
  },
  extensions = {},
})
tabline.apply_to_config(config)


-- and finally, return the configuration to wezterm
return config
