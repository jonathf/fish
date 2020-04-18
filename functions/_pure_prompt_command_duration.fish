function _pure_prompt_command_duration
    set --local command_duration

    # Get command execution duration
    if test -n "$CMD_DURATION"
        set command_duration (_pure_format_time $CMD_DURATION 5)
    end
    set --local command_duration_color (set_color red)

    echo "$command_duration_color$command_duration"
end
