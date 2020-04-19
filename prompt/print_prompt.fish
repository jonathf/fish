function print_prompt
	source $FISH_ROOT/prompt/string_width.fish

    set --local prompt

    for prompt_part in $argv
        if test (string_width $prompt_part) -gt 0
            set prompt "$prompt $prompt_part"
        end
    end

    echo (string trim -l $prompt)
end
