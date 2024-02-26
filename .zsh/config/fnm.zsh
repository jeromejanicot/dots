if ! exists fnm; then
	echo " -- Installing fnm"
	cargo install fnm
fi

eval "$(fnm env --use-on-cd)"
