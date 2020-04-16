# Defined in - @ line 1
function t --description 'pytest alias' --wraps 'pytest'
	if not test $PROJECT_ROOT
		set PROJECT_ROOT (git rev-parse --show-toplevel 2> /dev/null)
	end
	if count $argv > /dev/null
		set filepath $argv[1]
		set --erase argv[1]
	else if string match -r '\.py$' (nvim_bufferpath) > /dev/null
		set filepath (nvim_bufferpath)
	else
		set filepath '.'
	end
	set filepath (realpath --relative-to=$PROJECT_ROOT $filepath)
	pushd $PROJECT_ROOT
	pytest -vv --doctest-modules --maxfail=5 $argv $filepath
	popd
end
