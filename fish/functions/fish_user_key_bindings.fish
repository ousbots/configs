# Disable ctrl-d default keybinding of exiting.
function fish_user_key_bindings
    bind --erase --preset \cd
    bind --erase --preset --mode insert \cd
    bind --erase --preset --mode visual \cd
end
