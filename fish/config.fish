status is-interactive; and begin
    # Aliases
    alias l ls
    alias ll 'ls -a'
    alias ls 'eza -l --icons'
    alias cat bat
    alias find fd

    # Environment variables
    #set RIPGREP_CONFIG_PATH $HOME/.config/ripgreprc

    # Rust: $HOME/.cargo/bin
    if test -d $HOME/.cargo/bin
        contains $HOME/.cargo/bin $PATH
        or set PATH $HOME/.cargo/bin $PATH
    end

    # Go: $HOME/go/bin
    if test -d $HOME/go/bin
        contains $HOME/go/bin $PATH
        or set PATH $HOME/go/bin $PATH
    end

    # Enable vi mode
    fish_vi_key_bindings

    # starship
    eval (starship init fish)

    # editor
    set EDITOR hx
end
