if ! exists cargo; then
	echo " -- Installing cargo"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

. "$HOME/.cargo/env"
