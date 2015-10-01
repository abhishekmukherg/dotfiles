function cdtop
	set -e -g TRTOP
	set -xU TRTOP (cat ~/.trtop_env)
    cd $TRTOP
end
