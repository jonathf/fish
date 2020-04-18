function _pure_prompt_git \
    --description 'Print git repository informations: branch name, dirty, upstream ahead/behind'

    # only run if inside git folder
    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        return
    end

    # current git branch
    set --local git_branch (set_color brblack)(command git symbolic-ref --short HEAD 2>/dev/null;
        or command git name-rev --name-only HEAD 2>/dev/null)

    # The first checks for staged changes, the second for unstaged ones.
    # We put them in this order because checking staged changes is *fast*.
    set --local git_dirty
    if not command git diff-index --ignore-submodules --cached --quiet HEAD -- >/dev/null 2>&1
            or not command git diff --ignore-submodules --no-ext-diff --quiet --exit-code >/dev/null 2>&1
        set git_dirty (set_color brblack)'*'
    end

    set --local git_unpushed
    set --local git_unpulled
    set --local has_upstream (command git rev-parse --abbrev-ref '@{upstream}' 2>/dev/null)
    if test -n "$has_upstream"  # check there is an upstream repo configured
            and test "$has_upstream" != '@{upstream}' # Don't check the empty repo
        command git rev-list --left-right --count 'HEAD...@{upstream}' \
            | read --local --array git_status

        # upstream is behind local repo
        if test $git_status[1] -gt 0
            set git_unpushed (set_color cyan)'+'$git_status[1]
        end

        # upstream is ahead of local repo
        if test $git_status[2] -gt 0
            set git_unpulled (set_color cyan)'-'$git_status[2]
        end
    end

    echo "$git_branch$git_dirty $git_unpushed$git_unpulled"
end
