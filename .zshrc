# Source all files in zsh directory
for config_file ($HOME/zsh/*.zsh); do
  source $config_file
done

# bun completions
[ -s "/home/jerome/.bun/_bun" ] && source "/home/jerome/.bun/_bun"

autoload -Uz promptinit && promptinit && prompt pure

# starship
eval "$(proto activate zsh)"
