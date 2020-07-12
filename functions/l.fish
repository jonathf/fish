# Defined in - @ line 1
function l --description 'alias l git --no-pager ll -20' --wraps 'git --no-pager ll -20'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git --no-pager ll -20 $argv;
end
