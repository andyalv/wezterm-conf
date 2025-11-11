local wezterm = require("wezterm")

local keys = {
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}

return keys
