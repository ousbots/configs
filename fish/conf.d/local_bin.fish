# Add the ~/.local/bin path that is used by uv and other installers.
status is-interactive; and begin
    if test -d $HOME/.local/bin
        contains $HOME/.local/bin $PATH
        or set $HOME/.local/bin $PATH
    end
end
