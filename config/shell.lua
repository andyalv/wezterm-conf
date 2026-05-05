local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
    -- Execute Powershell as default program
    config.default_prog = { "pwsh.exe", "-NoLogo", "-NoProfileLoadTime" }
end

return module
