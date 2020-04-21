# Defined in - @ line 1
function nvim --description 'alias nvim nvim' --wraps '/usr/bin/nvim'
	# for some reason 'nvim --version' is called during tab-completion of vi
	if test "$argv" = '--version'
		/usr/bin/nvim --version
	else if test -z "$NVIM_LISTEN_ADDRESS"
		/usr/bin/nvim $argv;
	else
		for arg in $argv
			if not string match -r '^-' $arg
				$FISH_ROOT/venv/bin/python -c "
import neovim
with neovim.attach('socket', path='$NVIM_LISTEN_ADDRESS') as session:
	session.command('edit $arg')"
			end
		end
	end
end
