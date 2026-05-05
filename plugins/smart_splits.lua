local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
    -- Smart Splits plugin
    -- Used for moving between panes and between nvim and wezterm
    local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
    smart_splits.apply_to_config(config)
end

return module
