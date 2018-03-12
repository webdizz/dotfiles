#!/bin/sh
# set up additional software

$HOME/.dotfiles/script/install_java_eco.sh

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
    # MacOS related 
	$HOME/.vscode/install_extensions.sh
else
	# Nothing here for Linux for now
fi

