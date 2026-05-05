local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
    local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
    bar.apply_to_config(config)
end

return module
