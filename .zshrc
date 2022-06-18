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

if [[ 'uname -a | rg -iq "ubuntu"' ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
else
    source /opt/local/share/fzf/shell/key-bindings.zsh
    source /opt/local/share/fzf/shell/completion.zsh
fi

#
# NVM 
#
if [[ ! -d "$HOME/.nvm" ]] then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# pnpm
export PNPM_HOME="/home/lebeef/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end