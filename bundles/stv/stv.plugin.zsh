function stv_app_name {
	echo $PWD | grep 'globals_codeigniter' > /dev/null
	if [ $? -eq 0 ]; then
		echo globals
	else
		echo $PWD | sed -E -n 's/.*(:?Sites|phpapps)\/([^/]*)\.stv\.tv.*/\2/p'
	fi
}

function stv_prompt {
	echo $ZSH_THEME_STV_APP_PREFIX$(stv_app_name)$ZSH_THEME_STV_APP_SUFFIX
}
