function aurbuild --description 'download and install AUR' --wraps 'makepkg'
	set folder (string split "/" "$argv[1]")[-1]
	set folder "/home/$USER/src/$folder"
	if test -d $folder
		echo "folder $folder already exist; aborting"
		return 1
	end
	clone $argv[1] $folder
	pushd $folder
	makepkg --syncdeps --install $argv[2..-1]
	popd
end
