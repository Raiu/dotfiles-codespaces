export ZSH="$ZDOTDIR/oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export MYVIMRC='$XDG_CONFIG_HOME/vim/vimrc'
export VIMINIT='source $MYVIMRC'

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

