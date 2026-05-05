local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
    -- Local Theme Rotator
    -- Load the theme rotator plugin
    local theme_rotator = wezterm.plugin.require("https://github.com/koh-sh/wezterm-theme-rotator")
    theme_rotator.apply_to_config(config, {
        -- Next Theme
        next_theme_key = "n",
        next_theme_mods = "LEADER",

        -- Previous Theme
        prev_theme_key = "p",
        prev_theme_mods = "LEADER",

        -- Random Theme
        rand_theme_key = "r",
        rand_theme_mods = "LEADER",

        -- Default Theme
        default_theme_key = "d",
        default_theme_mods = "LEADER",
    })
end

return module
