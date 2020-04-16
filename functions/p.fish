# Defined in - @ line 1
function p --description 'python alias' --wraps 'python'
	if count $argv > /dev/null
		python $argv
	else if string match -r '\.py$' (nvim_bufferpath) > /dev/null
		python (nvim_bufferpath)
	else
		ipython
	end
end
