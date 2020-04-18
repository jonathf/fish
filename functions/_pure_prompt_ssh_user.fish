function _pure_prompt_ssh_user
    set --local username (whoami) # current user name
    set --local username_color (set_color brblack) # default color

    if test "$username" = "root"
        set username_color (set_color white) # different color for root
    end

    echo "$username_color$username"
end
