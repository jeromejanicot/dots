#
# GO
#
export GO_VERSION=1.18.3
export GO_ARCH=linux-amd64
export GO_HASH=beacbe1441bee4d7978b900136d1d6a71d150f0a9bb77e9d50c822065623a35a

if [[ ! -d "$HOME/go" ]] then
    wget https://go.dev/dl/go${GO_VERSION}.${GO_ARCH}.tar.gz
    #if [[ "sha256sum --check ${GO_HASH} go${GO_VERSION}-${GO_ARCH}.tar.gz" ]] then
        #echo " --- CHECKSUM MATCHES ---"
        tar -xvf go${GO_VERSION}.${GO_ARCH}.tar.gz 
        rm go${GO_VERSION}.${GO_ARCH}.tar.gz
    #fi
fi

#
# NVM 
#
if [[ ! -d "$HOME/.nvm" ]] then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

#
# SDKMAN
#
if [[ ! -d "$HOME/.sdkman" ]] then
    curl -s https://get.sdkman.io | bash
fi
. "$HOME/.sdkman/bin/sdkman-init.sh"

#
# RUSTUP
#
if [[ ! -d "$HOME/.rustup" ]] then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
. "$HOME/.cargo/env"

#
# PYENV
#
if [[ ! -d "$HOME/.pyenv" ]] then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#
# NVM 
#
if [[ ! -d "$HOME/.nvm" ]] then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

