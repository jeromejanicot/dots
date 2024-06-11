if [[ $DEVICE = "endives" ]]; then
   export PATH=$PATH:$HOME/Applications
elif [[ $DEVICE != "endives" ]]; then
   export PATH=/opt/local/bin:/opt/local/sbin:$PATH
   export PATH=$HOME/.local/bin:$PATH
fi
