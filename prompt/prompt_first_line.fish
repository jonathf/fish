function prompt_first_line \
    --description 'Print contextual information before prompt.'
	source $FISH_ROOT/prompt/prompt_ssh.fish
	source $FISH_ROOT/prompt/prompt_git.fish
	source $FISH_ROOT/prompt/prompt_command_duration.fish
	source $FISH_ROOT/prompt/print_prompt.fish
	source $FISH_ROOT/prompt/string_width.fish
	source $FISH_ROOT/prompt/prompt_current_folder.fish

    if not type -fq git  # exit if git is not available
        return 1
    end

    set --local prompt_ssh (prompt_ssh)
    set --local prompt_git (prompt_git)
    set --local prompt_command_duration (prompt_command_duration)
    set --local prompt (print_prompt \
                            $prompt_ssh \
                            $prompt_git \
                            $prompt_command_duration
                        )
    set --local prompt_width (string_width $prompt)
    set --local current_folder (prompt_current_folder $prompt_width)

    set --local prompt_components
    set prompt_components \
            $prompt_ssh \
            $current_folder \
            $prompt_git \
            $prompt_command_duration

    echo (print_prompt $prompt_components)
end
