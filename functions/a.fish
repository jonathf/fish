# Defined in - @ line 1
function a --description 'alias a git add' --wraps 'git add'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git add $argv;
end
