local wezterm = require("wezterm")

local module = {}

function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return 'Dark'
end

function module.apply_to_config(config)
    -- Rose Pine theme
    local rose_pine = wezterm.plugin.require('https://github.com/neapsix/wezterm')
    local appearance = get_appearance()
    local theme = appearance:find("Dark") and rose_pine.main or rose_pine.dawn

    -- Apply theme colors and window frame
    config.colors = theme.colors()
    config.window_frame = theme.window_frame()

    config.window_decorations = "RESIZE"
    config.font = wezterm.font("JetBrainsMono Nerd Font")
    config.enable_tab_bar = true
end

return module
