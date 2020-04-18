function _pure_prompt \
    --description 'Print prompt symbol' \
    --argument-names exit_code

    set --local jobs (_pure_prompt_jobs)
    set --local virtualenv (_pure_prompt_virtualenv) # Python virtualenv name
    set --local pure_symbol (_pure_prompt_symbol $exit_code)

    echo (_pure_print_prompt $jobs $virtualenv $pure_symbol)
end
