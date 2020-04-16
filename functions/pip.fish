# Defined in - @ line 1
function pip --wraps='pip' --description 'pip wrapper'
	if not count $argv > /dev/null
		command pip
	else
		if test -n $PIP_EXTRA_INDEX_URL
			set commands install develop download wheel
			for command in $commands
				if test $argv[1] = $command
					set extra_index_url "--extra-index-url=$PIP_EXTRA_INDEX_URL"
				end
			end
		end
		command pip $argv[1] $extra_index_url $argv[2..-1]
	end
end
