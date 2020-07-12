# Defined in - @ line 1
function s --description 'alias s git status -sb' --wraps 'git status -sb'
    set --local extra_args
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        echo "DOTFILES STATUS"
        set extra_args "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git $extra_args status --short --branch $argv;
    echo $argv
end
