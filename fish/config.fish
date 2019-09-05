## Base 16 Shell
#if status --is-interactive
#    eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
#end

# Build the PATH (emulate /etc/profile)
set PATH /usr/local/sbin /usr/local/bin /usr/bin $PATH

# Go: local builds
set PATH $PATH $HOME/go/bin

# Rust: local builds
set PATH $PATH $HOME/.cargo/bin

# NPM bullshit
set PATH $PATH $HOME/.npm-global

# Turn off python __pycache__ writing
set -x PYTHONDONTWRITEBYTECODE 'true'

# Wayland environmental variables
set -x MOZ_ENABLE_WAYLAND 1


# Keychain: auto-load ssh agent
if status --is-interactive
    keychain --eval --quiet -Q id_rsa | source
end

# Enable vi mode
fish_vi_key_bindings
