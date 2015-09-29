function ls
	# Just calculate this once, to save a few cycles when displaying the prompt
    if not set -q __fish_ls_uname
        set -g __fish_ls_uname (uname)
    end

    if [ $__fish_ls_uname = 'Darwin' ]
        command ls -G $argv
    else
        command ls --color=auto $argv
    end
end
