ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen/antigen.zsh

antigen-lib
antigen-bundle git
antigen-bundle osx
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle $ZSHA_BASE/bundles/stv

antigen-theme $ZSHA_BASE/themes/mgdm/mgdm.zsh-theme

antigen-apply

export CDPATH=$CDPATH:$HOME/Sites:$HOME
export PATH=$PATH:/opt/homebrew/bin
export VMWWW=/Volumes/www/html
export VMPHP=/Volumes/www/phpapps
