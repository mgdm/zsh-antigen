if [ "$(whoami)" = "root" ] 
then CARETCOLOR="red"
else CARETCOLOR="white"
fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{${fg[blue]}%}${USER}%{$reset_color%}@%{${fg[blue]}%}%m%{$reset_color%}:%{${fg[blue]}%}%1d%{${fg_bold[$CARETCOLOR]}%}%#%{${reset_color}%} '

RPS1=' ${return_code}  $(stv_prompt) $(git_prompt_info) %D{%Y-%m-%d %H:%M:%S}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:‹%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}›%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%} %{$fg[green]%}✔%{$reset_color%}"

ZSH_THEME_SVN_PROMPT_PREFIX="%{$fg[blue]%}svn:‹%{$fg_bold[cyan]%}"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$fg[blue]%}›%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_CLEAN="%{$fg[blue]%} %{$fg[green]%}✔%{$reset_color%}"

ZSH_THEME_STV_APP_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_STV_APP_SUFFIX="%{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"

# TODO use 265 colors
#MODE_INDICATOR="$FX[bold]$FG[020]<$FX[no_bold]%{$fg[blue]%}<<%{$reset_color%}"
# TODO use two lines if git
