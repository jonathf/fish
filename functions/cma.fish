# Defined in - @ line 1
function cma --description 'alias cma git commit -a' --wraps 'git commit -a'
	git commit -a $argv;
end
