## Base 16 Shell
#if status --is-interactive
#    eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
#end

# Build the PATH (emulate /etc/profile)
# Macports : /opt/local/sbin /opt/local/bin
set PATH /opt/local/sbin /opt/local/bin $PATH

# Enable vi mode
fish_vi_key_bindings
