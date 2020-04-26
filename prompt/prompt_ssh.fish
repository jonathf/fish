function prompt_ssh
    if test "$SSH_CONNECTION" = ""
        return
    end
    set --query --global hostname or set --local hostname (hostname -s) # current host name compatible busybox
    echo (set_color brblue)$hostname':'
end
