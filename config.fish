fish_vi_key_bindings

set --export BROWSER firefox
set --export EDITOR nvim
set --export VISUAL nvim

# If a local.fish file exist in your fish folder, source it.
# For storing local system stuff and secrets.
if test -f $FISH_ROOT/local.fish
    source $FISH_ROOT/local.fish
end

set --universal PIPENV_VENV_IN_PROJECT true
set --universal PIPENV_DEFAULT_PYTHON_VERSION 3.7
set --universal PIPENV_IGNORE_VIRTUALENVS 1

set --export DIRENV_LOG_FORMAT

set --export CARGO_ROOT "$HOME/.cargo"
set --export --append PATH "$CARGO_ROOT/bin"

set --export PYENV_ROOT "$HOME/.pyenv"
set --export --append PATH "$PYENV_ROOT/bin"
set direnv_path (command -v direnv)
if test -n "$direnv_path"
    eval (direnv hook fish)
    if not contains "$PYENV_ROOT/shims" $PATH
        pyenv init - | source
    end
end

# Deactivate the default virtualenv prompt so that we can add our own
set --global --export VIRTUAL_ENV_DISABLE_PROMPT 1
# Whether or not is a fresh session
set --global _pure_fresh_session true
# Register `_pure_prompt_new_line` as an event handler fot `fish_prompt`
functions -q _pure_prompt_new_line

