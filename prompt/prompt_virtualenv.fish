function prompt_virtualenv --description "Display virtualenv directory"
    if test -n "$VIRTUAL_ENV"
        set --local virtualenv (basename "$VIRTUAL_ENV")
        set --local virtualenv_color (set_color brblack)

        echo "$virtualenv_color$virtualenv"
    end
end
