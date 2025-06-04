# Source all files in zsh directory
for config_file ($HOME/zsh/*.zsh); do
  source $config_file
done

