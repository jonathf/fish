function _pure_prompt_git_branch
    set --local git_branch (_pure_parse_git_branch) # current git branch
    set --local git_branch_color (_pure_set_color brblack)

    echo "$git_branch_color$git_branch"
end
