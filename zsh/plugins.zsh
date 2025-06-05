source ~/.zplug/init.zsh

zplug "junegunn/fzf"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "jeffreytse/zsh-vi-mode"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
