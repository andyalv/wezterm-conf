local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
    -- Rose Pine theme
    local rose_pine = wezterm.plugin.require('https://github.com/neapsix/wezterm')

    -- Appearance options
    local appearance_themes =  {
        Dark = rose_pine.main,
        Light = rose_pine.dawn,
    }

    -- Get the appearance setting from environment variable or default to "Dark"
    local theme = appearance_themes[appearance] or appearance_themes.Dark

    -- Apply theme colors and window frame
    config.colors = theme.colors()
    config.window_frame = theme.window_frame()

    config.window_decorations = "RESIZE"
    config.font = wezterm.font("JetBrainsMono Nerd Font")
    config.enable_tab_bar = true
end

return module
