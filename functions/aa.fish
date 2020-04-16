# Defined in - @ line 1
function aa --description 'alias aa git add-all' --wraps 'git add-all'
	git add-all $argv;
end
