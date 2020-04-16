# Defined in - @ line 1
function clone --description 'alias clone git clone --recurse-submodules git@github.com:' --wraps 'git clone'
	git clone --recurse-submodules git@github.com:$argv[1] $argv[2..-1]
end
