function _pure_prompt_git \
    --description 'Print git repository informations: branch name, dirty, upstream ahead/behind'

    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        return
    end

    set --local git_prompt (_pure_prompt_git_branch)(_pure_prompt_git_dirty)
    set --local git_pending_commits (_pure_prompt_git_pending_commits)

    if test (_pure_string_width $git_pending_commits) -ne 0
        set git_prompt $git_prompt $git_pending_commits
    end

    echo $git_prompt
end
