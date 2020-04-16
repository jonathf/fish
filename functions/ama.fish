# Defined in - @ line 1
function ama --description 'alias ama git commit --amend -a' --wraps 'git commit --amend -a'
	git commit --amend -a $argv;
end
