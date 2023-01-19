local wezterm = require 'wezterm';

local mykeys = {}
for i = 1, 8 do
  table.insert(mykeys, {
    key=tostring(i),
    mods="CMD|ALT",
    action=wezterm.action{MoveTab=i-1},
  })
end

return {
  font = wezterm.font("JetBrains Mono"),
  font_size = 14.0,
  color_scheme = "Catppuccin Mocha",
  colors = {
    background = '#101116',
  },
  --color_scheme = "Blue Matrix",
  use_fancy_tab_bar = true,
  keys = mykeys,
}
