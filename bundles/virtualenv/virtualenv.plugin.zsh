export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_detect {
    # The cycle is just for the case with broken root folder detection – never do more than N iterations.
    venv_root=${1:-"."}
    venv_found=""
    for (( i=100; i > 0; i-- )); do
        venv_real=$(cd $venv_root && pwd -P)
        if [ -f "$venv_real/bin/activate" ]; then
            echo $venv_real
            return
        fi
        if [ "$venv_real" = "/" ]; then
            return
        fi
        venv_root=$venv_root/".."
    done
}

function virtualenv_detect_prompt {
	venv=$(virtualenv_detect)

	if [ -n "$VIRTUAL_ENV" ]; then
		if [ -f "$VIRTUAL_ENV/__name__" ]; then
			local name=`cat $VIRTUAL_ENV/__name__`
		elif [ `basename $VIRTUAL_ENV` = "__" ]; then
			local name=$(basename $(dirname $VIRTUAL_ENV))
		else
			local name=$(basename $VIRTUAL_ENV)
		fi
		echo "$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX$name$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"
	else
		if [ "x$venv" != 'x' ]; then
			if [ "x$VIRTUAL_ENV" = 'x' ]; then
				echo $ZSH_THEME_VIRTUAL_ENV_WARNING_PREFIX"inactive"$ZSH_THEME_VIRTUAL_ENV_WARNING_SUFFIX
			fi
		fi
	fi
}
