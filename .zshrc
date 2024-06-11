for function in ~/.zsh/functions/*; do
    source $function
done

export ZSH_CONFIG=$HOME/.zsh

export DEVICE=$(uname -n)

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
