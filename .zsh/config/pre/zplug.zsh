if [[ ! -d "$HOME/.zplug/" ]]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh

zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "marlonrichert/zsh-autocomplete"

if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load
