function ppid --description 'fish shell parent process id'
	if not count $argv > /dev/null
		set process $fish_pid
	else
		set process $argv[1]
	end
	cat /proc/$process/status | grep PPid | sed -r 's/PPid:\s+//'
end
