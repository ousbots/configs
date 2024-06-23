local wezterm = require "wezterm";

local mykeys = {}
for i = 1, 8 do
  table.insert(mykeys, {
    key=tostring(i),
    mods="OPT",
    action=wezterm.action{MoveTab=i-1},
  })
end

return {
  font = wezterm.font("JetBrains Mono"),
  font_size = 16.0,
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
