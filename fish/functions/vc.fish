function vc
	vim $TRTOP/config/hosts/(hostname -s).ini -c "view $TRTOP/config/common.ini | first"
end
