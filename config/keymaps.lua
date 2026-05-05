local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
    -- Keybindings
    config.leader = { key = "a", mods = "CTRL" }
    config.keys = {
        {
            key = "x",
            mods = "LEADER",
            action = wezterm.action.CloseCurrentPane({ confirm = true }),
        },
    }
end

return module
