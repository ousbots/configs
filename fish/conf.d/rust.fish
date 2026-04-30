# Add the rust bin path $HOME/.cargo/bin.
status is-interactive; and begin
    if test -d $HOME/.cargo/bin
        contains $HOME/.cargo/bin $PATH
        or set PATH $HOME/.cargo/bin $PATH
    end
end
