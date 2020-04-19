function prompt \
    --description 'Print prompt symbol' \
    --argument-names exit_code

	source $FISH_ROOT/prompt/prompt_jobs.fish
	source $FISH_ROOT/prompt/prompt_virtualenv.fish
	source $FISH_ROOT/prompt/print_prompt.fish

    set --local jobs (prompt_jobs)
    set --local virtualenv (prompt_virtualenv) # Python virtualenv name

    set --local symbol '$'
    if test "$fish_bind_mode" != "insert"
        set symbol '%'
    end
    if test $exit_code -ne 0
        set symbol (set_color red)$symbol
    else
        set symbol (set_color brgreen)$symbol
    end

    echo (print_prompt $jobs $virtualenv $symbol)
end
