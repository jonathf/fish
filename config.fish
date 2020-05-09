fish_vi_key_bindings

set --export LC_ALL en_US.UTF-8
set --export LANG en_US.UTF-8
set --export LANGUAGE en
set --export LC_MESSAGES C

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

# Fish color scheme match terminal
set -U fish_color_autosuggestion      brblack
set -U fish_color_command             brblue
set -U fish_color_comment             brred
set -U fish_color_cwd_root            red
set -U fish_color_end                 brmagenta
set -U fish_color_error               brred
set -U fish_color_escape              brcyan
set -U fish_color_history_current     --bold
set -U fish_color_host                normal
set -U fish_color_match               --background=brblue
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               brblue
set -U fish_color_quote               yellow
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        'bryellow' '--background=brblack'
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_user                brgreen
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'
