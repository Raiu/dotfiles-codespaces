# Env
export ZSH="$ZDOTDIR/oh-my-zsh"
fpath+=($ZDOTDIR/pure)

# Zsh
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Pure
autoload -U promptinit; promptinit

zstyle :prompt:pure:path color white
zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes

prompt pure

# Vim
export MYVIMRC='$XDG_CONFIG_HOME/vim/vimrc'
export VIMINIT='source $MYVIMRC'

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true
