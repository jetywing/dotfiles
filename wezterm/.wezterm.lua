-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_background_opacity = 0.67
config.macos_window_background_blur = 8

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- return the configuration to wezterm
return config
