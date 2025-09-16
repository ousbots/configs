status is-interactive; and begin
    # Aliases
    alias l ls
    alias ll 'ls -a'
    alias ls 'eza -l --icons'
    alias cat bat
    alias find fd

    # Environment variables
    if test -d $HOME/.config/ripgrep.config
        contains $HOME/.config/ripgrep.config $RIPGREP_CONFIG_PATH
        or set RIPGREP_CONFIG_PATH $HOME/.config/ripgrep.config
    end

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

    # Node: $HOME/.npm-global/bin
    if test -d $HOME/.npm-global/bin
        contains $HOME/.npm-global/bin $PATH
        or set PATH $HOME/.npm-global/bin $PATH
    end

    # Enable vi mode
    fish_vi_key_bindings

    # starship
    eval (starship init fish)

    # editor
    set EDITOR hx
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
