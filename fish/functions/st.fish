function st
	set -l curdir $PWD
    while true
        if test -e "$curdir/trtop.marker"
            set -g TRTOP $curdir
            return 0
        else if [ $curdir = "/" ]
            echo "Could not find TRTOP" >&2
            return 2
        else
            set curdir (dirname $curdir)
        end
    end
end
