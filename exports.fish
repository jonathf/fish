# General settings
set --export BROWSER "qutebrowser"
set --export DIRENV_LOG_FORMAT ""  # make direnv quite
set --export EDITOR "nvim"
[ -d $HOME/.cargo ] && set --export CARGO_ROOT "$HOME/.cargo"
set --export GPG_TTY `tty`
set --export LANG "en_US.UTF-8"
set --export LANGUAGE "en"
set --export LC_ALL "en_US.UTF-8"
set --export LC_MESSAGES "C"
set --export PIPENV_DEFAULT_PYTHON_VERSION "3.7"
set --export PIPENV_IGNORE_VIRTUALENVS "1"
set --export PIPENV_VENV_IN_PROJECT "true"
[ -d $HOME/.pyenv ] && set --export PYENV_ROOT "$HOME/.pyenv"
set --export REQUIREMENTS mypy ipython pep257 pylint
set --export VIRTUAL_ENV_DISABLE_PROMPT "1"
set --export VISUAL "nvim"

# Extend PATH
if test -d $HOME/.cargo; if not contains "$HOME/.cargo" $PATH; set --prepend PATH $CARGO_ROOT/bin; end; end
if test -d $HOME/.pyenv; if not contains "$HOME/.pyenv" $PATH; set --prepend PATH $PYENV_ROOT/bin; end; end
if not contains $HOME/.local/bin $PATH; set --prepend PATH $HOME/.local/bin; end

# Warnings
[ ! -d $HOME/.cargo ] && echo "cargo is missing; install by running: curl https://sh.rustup.rs -sSf | sh"
[ ! -d $HOME/.pyenv ] && echo "pyenv is missing; install by running: clone pyenv/pyenv ~/.pyenv"
