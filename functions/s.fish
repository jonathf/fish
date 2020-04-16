# Defined in - @ line 1
function s --description 'alias s git status -sb' --wraps 'git status -sb'
	git status -sb $argv;
end
