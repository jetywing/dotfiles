-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.colors = {
	background = "#00151a",
}

config.color_scheme = "JWR dark (terminal.sexy)"

config.window_background_opacity = 0.80
config.macos_window_background_blur = 8

-- will enable if I can fix ugly border overlap
-- config.window_frame = {
-- 	border_left_width = "0.5cell",
-- 	border_right_width = "0.5cell",
-- 	border_bottom_height = "0.25cell",
-- 	border_top_height = "0.25cell",
-- 	border_left_color = "#093F6A",
-- 	border_right_color = "#093F6A",
-- 	border_bottom_color = "#093F6A",
-- 	border_top_color = "#093F6A",
-- }

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- return the configuration to wezterm
return config
