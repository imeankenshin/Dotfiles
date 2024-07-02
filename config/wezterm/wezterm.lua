local wezterm = require 'wezterm'
local config = wezterm.config_builder()
-- font

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 14
-- window

local x = 16 * 6
local y = 16 * 2

config.window_padding = {
  left = x,
  right = x,
  top = y,
  bottom = y,
}
config.color_scheme = 'Tokyo Night'
--- keybindings

config.keys = {
  {key="p", mods="CMD", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  {key="i", mods="CMD", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  {key="l", mods="CMD", action=wezterm.action{ActivatePaneDirection="Right"}},
  {key="j", mods="CMD", action=wezterm.action{ActivatePaneDirection="Down"}},
  {key="k", mods="CMD", action=wezterm.action{ActivatePaneDirection="Up"}},
  {key="h", mods="CMD", action=wezterm.action{ActivatePaneDirection="Left"}},
}

-- reutrn

return config

