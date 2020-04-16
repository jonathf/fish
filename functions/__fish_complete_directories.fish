# Defined in /usr/share/fish/functions/__fish_complete_directories.fish @ line 6
function __fish_complete_directories --description 'Complete directory prefixes' --argument comp desc
    if not set -q desc[1]
        set desc (_ "Directory")
    end

    if not set -q comp[1]
        set comp (commandline -ct)
    end

    # HACK: We call into the file completions by using a non-existent command.
    # If we used e.g. `ls`, we'd run the risk of completing its options or another kind of argument.
    # But since we default to file completions, if something doesn't have another completion...
    set -l dirs (complete -C"nonexistentcommandooheehoohaahaahdingdongwallawallabingbang $comp" | string match -r '.*/$')

    if set -q dirs[1]
        printf "%s\t$desc\n" $dirs
    end
end
