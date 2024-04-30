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


return config
