# Defined in - @ line 1
function clone --description 'alias clone git clone --recurse-submodules git@github.com:' --wraps 'git clone'
	set --local arg1 $argv[1]
	if not string match -r '^\w+[@:]' $arg1 >/dev/null
		set arg1 git@github.com:$arg1
	end
	git clone --recurse-submodules $arg1 $argv[2..-1]
end
