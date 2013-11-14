ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen/antigen.zsh

antigen-use oh-my-zsh
antigen-bundle git

if [ "$OSTYPE"="darwin11.0" ]; then
	antigen-bundle osx
fi

antigen-bundle vagrant
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
antigen-bundle $ZSHA_BASE/bundles/git-completion
antigen-bundle $ZSHA_BASE/bundles/stv
antigen-bundle $ZSHA_BASE/bundles/virtualenv

antigen-theme $ZSHA_BASE/themes/mgdm/mgdm.zsh-theme

antigen-apply

export CDPATH=$CDPATH:$HOME/Sites:$HOME
export PATH=$HOME/.rbenv/bin:$HOME/bin:/opt/homebrew/bin:$HOME/.composer/vendor/bin:/usr/local/mysql/bin:$PATH
export VMWWW=/Volumes/www/html
export VMPHP=/Volumes/www/phpapps
export EDITOR=vim

if [ -d $HOME/.rbenv ]; then
	eval "$(rbenv init -)"
fi

if [ -d $HOME/.phpbrew ]; then
	source $HOME/.phpbrew/bashrc
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	source /usr/local/bin/virtualenvwrapper.sh
	export WORKON_HOME=$HOME/Code/VirtualEnvs
fi

alias pretty='pygmentize -g -O encoding=utf-8'

if [ -f /opt/homebrew/bin/src-hilite-lesspipe.sh ]; then
export LESSOPEN="| /opt/homebrew/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
fi
