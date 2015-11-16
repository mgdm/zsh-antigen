if [ "$(whoami)" = "root" ] 
then CARETCOLOR="red"
else CARETCOLOR="white"
fi

host_color=0
local i=1
for val in $(echo $HOST | od -A n -t dC); do
	host_color=$(($host_color + $i * $val))
	i=$((i + 1))
done
host_color=$((1 + $host_color % 7))

return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{${fg[blue]}%}${USER}%{$reset_color%}@%F{$host_color}%m%{$reset_color%}:%{${fg[blue]}%}%1~%{${fg_bold[$CARETCOLOR]}%}%#%{${reset_color}%} '

RPS1='${return_code} $(stv_prompt) $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_no_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_no_bold[green]%}✔%{$reset_color%}"

ZSH_THEME_SVN_PROMPT_PREFIX="%{$fg[blue]%}svn:%{$fg_bold[cyan]%}"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$fg[blue]%}%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_DIRTY=" %{$fg_no_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_CLEAN=" %{$fg_no_bold[green]%}✔%{$reset_color%}"

ZSH_THEME_STV_APP_PREFIX="%{$fg[blue]%}stv:%{$fg[yellow]%}"
ZSH_THEME_STV_APP_SUFFIX="%{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[blue]%}ve:‹%{$fg_bold[cyan]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$fg[blue]%}›%{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_WARNING_PREFIX="%{$fg[blue]%}ve:‹%{$fg_bold[red]%}"
ZSH_THEME_VIRTUAL_ENV_WARNING_SUFFIX="%{$fg[blue]%}›%{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"

# TODO use 265 colors
#MODE_INDICATOR="$FX[bold]$FG[020]<$FX[no_bold]%{$fg[blue]%}<<%{$reset_color%}"
# TODO use two lines if git
