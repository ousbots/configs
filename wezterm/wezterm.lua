local wezterm = require "wezterm";

local keys = {}
for i = 1, 8 do
  table.insert(keys, {
    key = tostring(i),
    mods = "OPT",
    action = wezterm.action{MoveTab=i-1},
  })
end

table.insert(keys, {
  key = "w",
  mods = "OPT",
  action = wezterm.action.CloseCurrentTab{ confirm = true },
})

return {
  -- font = wezterm.font("Monaspace Neon"),
  font = wezterm.font("Codelia Ligatures"),
  font_size = 17.0,
  line_height = 1.0,
  window_decorations = "TITLE | RESIZE",
  color_scheme = "catppuccin-mocha",
  colors = {
    background = "#101110",
  },
  use_fancy_tab_bar = true,
  adjust_window_size_when_changing_font_size = false,
  keys = mykeys,
  front_end = "WebGpu",
}
