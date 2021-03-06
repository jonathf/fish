set fail 1

function prompt_current_folder --argument-names current_prompt_width

    if test -z "$current_prompt_width"; return $fail; end

    set --local current_folder (parse_directory (math $COLUMNS - $current_prompt_width - 1))
    set --local current_folder_color (set_color bryellow)

    echo "$current_folder_color$current_folder"
end
