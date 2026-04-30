# Add the node bin path $HOME/.npm-global/bin.
status is-interactive; and begin
    if test -d $HOME/.npm-global/bin
        contains $HOME/.npm-global/bin $PATH
        or set PATH $HOME/.npm-global/bin $PATH
    end
end
