function stv_app_name {
	if [[ "$OSTYPE" =~ "^darwin" ]]; then
		sedopts='En'
	else
		sedopts='rn'
	fi

	echo $PWD | grep 'globals_codeigniter' > /dev/null
	if [ $? -eq 0 ]; then
		echo globals
	else
		echo $PWD | sed -$sedopts -e 's/.*(:?Sites|phpapps)\/([^/]*)\.stv\.tv.*/\2/p'
	fi
}

function stv_prompt {
	appName=$(stv_app_name)

	if [ "x$appName" != "x" ]; then
		echo $ZSH_THEME_STV_APP_PREFIX$(stv_app_name)$ZSH_THEME_STV_APP_SUFFIX
	fi
}
