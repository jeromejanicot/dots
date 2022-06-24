eval "$(starship init zsh)"
export ZSH_CONFIG=$HOME/.zsh

#
# ZPLUG
#

export ZPLUG_HOME=$HOME/.zplug
export ZPLUG_CACHE_DIR=$HOME/.cache/zplug
export ZPLUG_LOADFILE=$ZSH_CONFIG/zplug.zsh

if [[ ! -f $ZPLUG_HOME/init.zsh ]]; then
    if (( $+commands[git] )); then
         git clone https://github.com/zplug/zplug $ZPLUG_HOME
    else
        echo "git not found" >%2
        exit 1
    fi
fi

source $ZPLUG_HOME/init.zsh



if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

#
# ZSH
#

__source() {
    if [[ -f $1 ]]; then
        source "$1"
    fi
}

__source $ZSH_CONFIG/functions.zsh
__source $ZSH_CONFIG/aliases.zsh
__source $ZSH_CONFIG/path.zsh

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi


source $ZSH_CONFIG/setup.zsh
