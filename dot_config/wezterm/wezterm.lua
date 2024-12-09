local wezterm = require("wezterm")

-- Initialize the configuration table
local config = wezterm.config_builder()

-- Set default program based on platform
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
else
	config.default_prog = { "/bin/zsh" }
end

-- Appearance settings
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.0
config.line_height = 1.0
config.adjust_window_size_when_changing_font_size = false
config.command_palette_font_size = 14
config.window_frame = {
	font = wezterm.font("JetBrainsMono Nerd Font"),
}
config.initial_cols = 200
config.initial_rows = 50
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
config.integrated_title_button_style = "Windows"
config.integrated_title_button_alignment = "Right"
config.integrated_title_button_color = "Auto"

config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.8,
}

-- config.disable_default_key_bindings = true

-- config.leader = { key = "A", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {

	-- Command Palette launcher
	{ key = "Space", mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncher },
	{ key = "X", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },

	-- Pane navigation
	{ key = "H", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "J", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "K", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },

	-- Pane splitting
	{
		key = "S",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "V",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},

	-- Pane resizing
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }) },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }) },

	-- Copy and paste
	{ key = "C", mods = "CTRL", action = wezterm.action({ CopyTo = "Clipboard" }) },
	{ key = "V", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },

	-- Tab management
	{ key = "T", mods = "CTRL|SHIFT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "W", mods = "CTRL|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },

	-- Quick tab switching
	{ key = "1", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 8 }) },

	-- Launch external programs
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ SpawnCommandInNewTab = { args = { "explorer.exe" } } }),
	},
}

-- Mouse bindings
config.mouse_bindings = {
	-- Right-click to paste
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},

	-- Ctrl + Left-click to open link
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},

	-- Window drag with Super or Ctrl + Shift + Left-click
	{
		event = { Drag = { streak = 1, button = "Left" } },
		mods = "CTRL|SHIFT",
		action = wezterm.action.StartWindowDrag,
	},
}

-- Other settings
config.enable_scroll_bar = false
config.scrollback_lines = 1000 -- Default is 3500, reduce to speed up
config.audible_bell = "Disabled"
config.max_fps = 240
config.front_end = "WebGpu"

-- Optional: Configure some additional GPU-related optimizations
config.freetype_load_target = "Light" -- Font rendering optimization

-- Function to set up tabs on startup
-- wezterm.on("gui-startup", function(cmd)
--     local mux = wezterm.mux
--
--     -- Create the first tab and set its title to "Neovim"
--     local tab1, pane1, window = mux.spawn_window(cmd or {})
--
--     tab1:set_title("Neovim")
--
--     -- Split the first tab horizontally
--     local pane2 = pane1:split({
--         direction = "Right",
--         cwd = wezterm.home_dir
--     })
--
--     -- Create the second tab and set its title to ""
--     local tab2  = window:spawn_tab({
--         cwd = wezterm.home_dir,
--         args = { "yazi" }
--     })
--     tab2:set_title("Yazi")
--
--     -- Activate the first tab by default
--     window:activate_tab(tab1)
-- end)
--
--
--
--

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
	options = {
		icons_enabled = true,
		theme = "Catppuccin Mocha",
		color_overrides = {},
		section_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
		component_separators = {
			left = wezterm.nerdfonts.pl_left_soft_divider,
			right = wezterm.nerdfonts.pl_right_soft_divider,
		},
		tab_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
	},
	sections = {
		tabline_a = { "mode" },
		tabline_b = { "workspace" },
		tabline_c = { " " },
		tab_active = {
			"index",
			{ "process", padding = 0 },
			"/",
			{ "cwd", padding = { left = 0, right = 1 } },
			{ "zoomed", padding = 0 },
		},
		tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
		tabline_x = { "ram", "cpu" },
		tabline_y = { "datetime", "battery" },
		tabline_z = { "hostname" },
	},
	extensions = {},
})
tabline.apply_to_config(config)

return config
