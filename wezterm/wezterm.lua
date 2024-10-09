local wezterm = require "wezterm";

config = {
  -- Keybindings:
  keys = {
    -- Show a confirmation prompt when closing a tab.
    {
      key = "q",
      mods = "CMD",
      action = wezterm.action.CloseCurrentTab{ confirm = true },
    },
    {
      key = "w",
      mods = "CMD",
      action = wezterm.action.CloseCurrentTab{ confirm = true },
    },
  },

  -- Always prompt when closing a window.
  skip_close_confirmation_for_processes_named = {},
  window_close_confirmation = "AlwaysPrompt",

  -- Fonts.
  -- font = wezterm.font("Monaspace Neon"),
  font = wezterm.font("Codelia Ligatures"),
  font_size = 17.0,
  line_height = 1.0,

  -- Theme.
  window_decorations = "TITLE | RESIZE",
  color_scheme = "catppuccin-mocha",
  colors = {
    background = "#101110",
  },
  use_fancy_tab_bar = true,
  adjust_window_size_when_changing_font_size = false,

  -- Rendering engine.
  front_end = "WebGpu",
}

return config
