if ! exists starship; then
	echo " -- Installing starship"
	cargo install starship
fi

eval "$(starship init zsh)"
