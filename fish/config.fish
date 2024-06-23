status is-interactive; and begin
    # Aliases
    alias cl 'cd $argv and ls'
    alias l ls
    alias ll 'ls -a'
    alias ls 'eza -l --icons'

    # Environment variables
    #set RIPGREP_CONFIG_PATH $HOME/.config/ripgreprc

    # Rust: $HOME/.cargo/bin
    if test -d $HOME/.cargo/bin
        contains $HOME/.cargo/bin $PATH
        or set PATH $HOME/.cargo/bin $PATH
    end

    # Enable vi mode
    fish_vi_key_bindings

    # starship
    eval (starship init fish)

    # editor
    set EDITOR hx
end
