function nvim_id --description 'Unique name identifier for nvim session'
	if test -n "$NVIM_LISTEN_ADDRESS"
		echo -s "NVIM_ID_" $NVIM_LISTEN_ADDRESS | sed -r 's,/tmp/nvim(.+?)/0,\1,'
		return 0
	end
	return 1
end
