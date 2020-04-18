function _pure_prompt \
    --description 'Print prompt symbol' \
    --argument-names exit_code

    set --local jobs (_pure_prompt_jobs)
    set --local virtualenv (_pure_prompt_virtualenv) # Python virtualenv name

    set --local symbol '$'
    if test "$fish_bind_mode" != "insert"
        set symbol '%'
    end
    if test $exit_code -ne 0
        set symbol (set_color red)$symbol
    else
        set symbol (set_color brgreen)$symbol
    end

    echo (_pure_print_prompt $jobs $virtualenv $symbol)
end
