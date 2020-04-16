function nvim_bufferpath --description 'The path to the last buffer visited in nvim'
	if test -n $NVIM_LISTEN_ADDRESS
		set identifier (nvim_id)
		eval "echo \$$identifier"
	end
end
