fish_vi_key_bindings

set --universal FISH_ROOT (dirname (readlink -f (status -f)))
test -f $FISH_ROOT/exports.fish && source $FISH_ROOT/exports.fish
test -f $FISH_ROOT/colors.fish && source $FISH_ROOT/colors.fish
test -f $FISH_ROOT/local.fish && source $FISH_ROOT/local.fish

set --local direnv_path (command -v direnv)
if test -n $direnv_path
    eval (direnv hook fish)
    if not contains $PYENV_ROOT/shims $PATH
        pyenv init - | source
    end
end

if test -n $DESKTOP_SESSION
    set (gnome-keyring-daemon --start | string split "=")
end
