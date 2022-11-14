#
# Executes commands at login pre-zshrc.
#

alias ctail='grc tail'
alias em='emacs'
alias emd='emacs --daemon'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias dc='docker-compose'
alias dcr='docker'
alias kc='kubectl'
alias tf='terraform'

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
	# nothing here
else
	# DL box
	export CUDA_VERSION=10.1
	export PATH=/usr/local/cuda-${CUDA_VERSION}/bin${PATH:+:${PATH}}
	export LD_LIBRARY_PATH=/usr/local/cuda-${CUDA_VERSION}/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi

export LC_ALL="en_US.UTF-8"