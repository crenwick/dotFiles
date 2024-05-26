-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = true

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "zenbones_dark"
		-- return "rose-pine-moon"
	else
		return "zenbones"
	end
end

config.color_scheme = scheme_for_appearance(get_appearance())

-- and finally, return the configuration to wezterm
return config

-- vim: ts=2 sts=2 sw=2 et
