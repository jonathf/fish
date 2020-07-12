# Defined in - @ line 1
function cm --description 'alias cm git commit' --wraps 'git commit'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git commit $argv;
end
