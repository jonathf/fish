# Defined in - @ line 1
function t --description 'pytest alias' --wraps 'pytest'
	if not test $PROJECT_ROOT
		set PROJECT_ROOT (git rev-parse --show-toplevel 2> /dev/null)
	end
	for idx in (seq (count $argv))
		if test -f $argv[$idx]
			set argv[$idx] (realpath --relative-to=$PROJECT_ROOT $argv[$idx])
		end
	end
	if test (count $argv) = 0
		set filepath $argv[1]
		set --erase argv[1]
	else
		set argv '.'
	end
	pushd $PROJECT_ROOT
	pytest -vv --doctest-modules --maxfail=5 $argv
	popd
end
