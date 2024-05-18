-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font_size = 13.5
-- config.color_scheme = "AdventureTime"

config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
