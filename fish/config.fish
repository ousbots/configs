set -x PATH $PATH /usr/sbin /usr/local/bin /usr/bin/core_perl

# Base 16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end

#if status --is-interactive
#    keychain --env fish --quiet -Q id_rsa | source
#end
