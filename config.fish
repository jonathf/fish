fish_vi_key_bindings

set --export BROWSER firefox
set --export EDITOR nvim
set --export VISUAL nvim

# Where are we? Used in some of the scripts.
set --universal FISH_ROOT (dirname (readlink -f (status -f)))

# If a local.fish file exist in your fish folder, source it.
# For storing local system stuff and secrets.
if test -f $FISH_ROOT/local.fish
    source $FISH_ROOT/local.fish
end

if test -d $HOME/.cargo
    set --export CARGO_ROOT "$HOME/.cargo"
    set --export --append PATH "$CARGO_ROOT/bin"
end

if test -d $HOME/.pyenv
    set --export PYENV_ROOT "$HOME/.pyenv"
    set --export --append PATH "$PYENV_ROOT/bin"
else
    echo "pyenv is missing; install by running: clone pyenv/pyenv ~/.pyenv"
end

set --export DIRENV_LOG_FORMAT ""  # make direnv quite
set --local direnv_path (command -v direnv)
if test -n "$direnv_path"
    eval (direnv hook fish)
    if not contains "$PYENV_ROOT/shims" $PATH
        pyenv init - | source
    end
end

# Deactivate the default virtualenv prompt so that we can add our own
set --global --export VIRTUAL_ENV_DISABLE_PROMPT 1

set --universal PIPENV_VENV_IN_PROJECT true
set --universal PIPENV_DEFAULT_PYTHON_VERSION 3.7
set --universal PIPENV_IGNORE_VIRTUALENVS 1

set fish_color_autosuggestion brblack
