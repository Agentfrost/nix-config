local wezterm = require "wezterm"

local config = wezterm.config_builder()

config.front_end = "WebGpu"
config.font = wezterm.font("JetBrainsMono Nerd Font", {weight = 'Medium', italic = false})
config.font_size = 10
config.line_height = 1

config.color_scheme = "Gruvbox Dark (Gogh)"
config.hide_tab_bar_if_only_one_tab = true;
config.window_decorations = "NONE"
config.enable_scroll_bar = false;
config.window_padding = {left = 0, right = 0, top = 0, bottom = 0};

config.use_dead_keys = false
config.keys = {
  {
    key = "s",
    mods = "ALT|SHIFT",
    action = wezterm.action.SplitVertical {domain="CurrentPaneDomain"}
  },
  {
    key = "s",
    mods = "ALT",
    action = wezterm.action.SplitHorizontal {domain="CurrentPaneDomain"}
  },
  {
    key = "w",
    mods = "ALT",
    action = wezterm.action.CloseCurrentPane {confirm=true}
  },
  {
    key = "h",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection "Left"
  },
  {
    key = "j",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection "Down"
  },
  {
    key = "k",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection "Up"
  },
  {
    key = "l",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection "Right"
  },
  {
    key = "h",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize {"Left", 1}
  },
  {
    key = "j",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize {"Down", 1}
  },
  {
    key = "k",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize {"Up", 1}
  },
  {
    key = "l",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize {"Right", 1}
  }
};


return config
