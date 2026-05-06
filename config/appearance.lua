local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

local rose_pine = wezterm.plugin.require("https://github.com/neapsix/wezterm")

local themes = {
    Dark = rose_pine.main,
    Light = rose_pine.dawn,
}

local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return "Dark"
end

local function resolve_theme(theme_name)
    return themes[theme_name] or themes.Dark
end

local function apply_theme(config, theme_name)
    local theme = resolve_theme(theme_name)
    config.colors = theme.colors()
    config.window_frame = theme.window_frame()
end

function module.set_window_theme(window, theme_name)
    local overrides = window:get_config_overrides() or {}
    local theme = resolve_theme(theme_name)

    overrides.colors = theme.colors()
    overrides.window_frame = theme.window_frame()

    window:set_config_overrides(overrides)
end

function module.register_events()
    if module._events_registered then
        return
    end

    wezterm.on("theme-dark", function(window, pane)
        module.set_window_theme(window, "Dark")
    end)

    wezterm.on("theme-light", function(window, pane)
        module.set_window_theme(window, "Light")
    end)

    wezterm.on("augment-command-palette", function(window, pane)
        return {
            {
                brief = "Theme: Dark",
                doc = "Switch this window to the a dark theme.",
                action = act.EmitEvent("theme-dark"),
            },
            {
                brief = "Theme: Light",
                doc = "Switch this window to the a light theme.",
                action = act.EmitEvent("theme-light"),
            },
        }
    end)

    module._events_registered = true
end

function module.apply_to_config(config)
    apply_theme(config, get_appearance():find("Light") and "Light" or "Dark")

    config.window_decorations = "RESIZE"
    config.font = wezterm.font("JetBrainsMono Nerd Font")
    config.enable_tab_bar = true
end

return module
