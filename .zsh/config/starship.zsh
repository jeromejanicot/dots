if ! exists starship; then
	echo " -- Installing starship"
	brew install starship
fi

eval "$(starship init zsh)"
