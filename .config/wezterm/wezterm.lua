-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
-- config.initial_cols = 120
-- config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font = wezterm.font {
  family = 'FiraCode Nerd Font',
  weight = 'Medium',
}
config.color_scheme = 'GruvboxDark'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.5

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'C:/Program Files/PowerShell/7/pwsh.exe' }
  config.window_decorations = "RESIZE"
  -- config.win32_system_backdrop = 'Acrylic'
  config.window_frame = {
    border_left_width = '0.2cell',
    border_right_width = '0.2cell',
    border_bottom_height = '0.1',
    border_top_height = '0.1cell',
    border_left_color = 'orange',
    border_right_color = 'orange',
    border_bottom_color = 'orange',
    border_top_color = 'orange',
  }
  config.font_size = 14
else
  config.default_prog = { '/usr/bin/fish' }
  config.font_size = 12
end

config.keys = {
  {
    key = 'P',
    mods = 'CTRL',
    action = wezterm.action.ActivateCommandPalette,
  },
}

-- Finally, return the configuration to wezterm:
return config
