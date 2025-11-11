-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Execute Powershell as default program
config.default_prog = { "pwsh.exe", "-NoLogo", "-NoProfileLoadTime" }

-- Keybindings
config.leader = { key = "b", mods = "CTRL" }
config.keys = require("config.keybindings")

config.window_decorations = "RESIZE"
config.font = wezterm.font("Hack Nerd Font")

-- Smart Splits plugin
-- Used for moving between panes and between nvim and wezterm
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config)

return config
