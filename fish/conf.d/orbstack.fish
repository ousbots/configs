# Add the orbstack tools bin path $HOME/.orbstack/bin.
status is-interactive; and begin
    if test -d $HOME/.orbstack/bin
        contains $HOME/.orbstack/bin $PATH
        or set PATH $HOME/.orbstack/bin $PATH
    end
end
