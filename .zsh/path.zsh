#PORT_HELIX="/opt/local/share/helix/runtime"
#if [ ! -d "$HOME/.config/helix/runtime" ]; then
#    mkdir -p $HOME/.config/helix
#    ln -s $PORT_HELIX $HOME/.config/helix/runtime
#    echo "Created Sym for Helix Runtime"
#fi


export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

