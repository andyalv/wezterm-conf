local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
    -- Rose Pine theme
    local rose_pine = wezterm.plugin.require('https://github.com/neapsix/wezterm')
    local theme = rose_pine.moon -- alternatives: main, moon, dawn

    -- Apply theme colors and window frame
    config.colors = theme.colors()
    config.window_frame = theme.window_frame()

    config.window_decorations = "RESIZE"
    config.font = wezterm.font("JetBrainsMono Nerd Font")
    config.enable_tab_bar = true
end

return module
