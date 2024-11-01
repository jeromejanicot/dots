export ZSH_CONFIG=$HOME/.zsh

for function in $ZSH_CONFIG/functions/*; do
    source $function
done

export PATH=/usr/local/bin:$PATH

for config in $ZSH_CONFIG/config/pre/*; do
    . $config
done

for config in $ZSH_CONFIG/config/*; do
    case "$config" in
    "$ZSH_CONFIG"/(pre|post)/*)
        :
    ;;
    *)
        . $config
    ;;
    esac
done
alias dots="/usr/bin/git --git-dir=$HOME/.dots --work-tree=$HOME"
