# Defined in - @ line 1
function nvim --description 'alias nvim nvim' --wraps '/usr/bin/nvim'
	# for some reason 'nvim --version' is called during tab-completion of vi
	if test "$argv" = '--version'
		/usr/bin/nvim --version
	else if test -z "$NVIM_LISTEN_ADDRESS"
		/usr/bin/nvim $argv;
	else
		nvim-terminal-edit $argv;
	end
end
