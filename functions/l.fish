# Defined in - @ line 1
function l --description 'alias l git --no-pager ll -20' --wraps 'git --no-pager ll -20'
	git --no-pager ll -20 $argv;
end
