-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Configuration
require("config.shell").apply_to_config(config)
require("config.appearance").apply_to_config(config)
require("config.keymaps").apply_to_config(config)

-- Plugins
-- require("config.plugins.theme_rotator").apply_to_config(config)
require("plugins.bar").apply_to_config(config)
require("plugins.smart_splits").apply_to_config(config)
require("plugins.wez-tmux.plugin").apply_to_config(config, {})


return config
