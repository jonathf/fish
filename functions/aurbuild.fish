function aurbuild --description 'download and install AUR' --wraps 'makepkg'
	set --local uri $argv[1]
	set --local folder (string split "/" "$uri")[-1]

	if not string match -r '/' $uri >/dev/null
		set uri "https://aur.archlinux.org/$uri.git"
	end

	set folder "/home/$USER/src/$folder"
	if test -d $folder
		echo "folder $folder already exist; aborting"
		return 1
	end
	clone $uri $folder
	pushd $folder
	makepkg --syncdeps --install $argv[2..-1]
	popd
end
