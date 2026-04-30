# Add the go bin path $HOME/go/bin.
status is-interactive; and begin
    if test -d $HOME/go/bin
        contains $HOME/go/bin $PATH
        or set PATH $HOME/go/bin $PATH
    end
end
