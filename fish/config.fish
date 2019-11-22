## Base 16 Shell
#if status --is-interactive
#    eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
#end

# Build the PATH (emulate /etc/profile)
# Go: /Users/tim/go/bin
# Rust: /Users/tim/.cargo/bin
set PATH /Users/tim/go/bin /Users/tim/.cargo/bin $PATH

# Enable vi mode
fish_vi_key_bindings

# starship
eval (starship init fish)
