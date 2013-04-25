ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen/antigen.zsh

antigen-lib
antigen-bundle git

if [ "$OSTYPE"="darwin11.0" ]; then
	antigen-bundle osx
fi

antigen-bundle vagrant
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
antigen-bundle $ZSHA_BASE/bundles/stv

antigen-theme $ZSHA_BASE/themes/mgdm/mgdm.zsh-theme

antigen-apply

export CDPATH=$CDPATH:$HOME/Sites:$HOME
export PATH=$HOME/.rbenv/bin:$HOME/bin:/opt/homebrew/bin:$PATH
export VMWWW=/Volumes/www/html
export VMPHP=/Volumes/www/phpapps
export EDITOR=vim

if [ -d $HOME/.rbenv ]; then
	eval "$(rbenv init -)"
fi

if [ -d $HOME/.phpbrew ]; then
	source $HOME/.phpbrew/bashrc
fi
