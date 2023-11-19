local wezterm = require 'wezterm';

local mykeys = {}
for i = 1, 8 do
  table.insert(mykeys, {
    key=tostring(i),
    mods="CTRL",
    action=wezterm.action{MoveTab=i-1},
  })
end

return {
  font = wezterm.font("JetBrains Mono"),
  font_size = 16.0,
  color_scheme = "catppuccin-mocha",
  colors = {
    background = '#101110',
  },
  use_fancy_tab_bar = true,
  keys = mykeys,
}
