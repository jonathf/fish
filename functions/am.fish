# Defined in - @ line 1
function am --description 'alias am git commit --amend' --wraps 'git commit --amend'
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set --append argv "--git-dir=$HOME/.config/dotfiles" "--work-tree=$HOME"
    end
    git commit --amend $argv;
end
