# Defined in - @ line 1
function D --description 'alias D exit'
	if test -n "$NVIM_LISTEN_ADDRESS"
		~/cfg/bin/nvim-terminal-unload
	end
	exit
end
