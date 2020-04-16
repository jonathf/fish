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

set --universal pure_symbol_prompt \$
set --universal pure_symbol_reverse_prompt %
set --universal pure_symbol_git_unpulled_commits -
set --universal pure_symbol_git_unpushed_commits +
set --universal pure_symbol_git_dirty \*
set --universal pure_symbol_title_bar_separator —
set --universal pure_reverse_prompt_symbol_in_vimode true
set --universal pure_begin_prompt_with_current_directory false
set --universal pure_separate_prompt_on_error false

set --universal pure_color_primary bryellow
set --universal pure_color_success brgreen
