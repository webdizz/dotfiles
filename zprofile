#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

alias ll='ls -la'
alias ctail='grc tail'
alias em='emacs'
alias emd='emacs --daemon'
alias e='emacsclient -t'
alias ec='emacsclient -c'

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
	alias j8='export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"; export PATH="${JAVA_HOME}/bin:$PATH"'
	alias j9='export JAVA_HOME="`/usr/libexec/java_home -v 9`"; export PATH="${JAVA_HOME}/bin:$PATH"'
else
	# DL box
	export CUDA_VERSION=9.1
	export PATH=/usr/local/cuda-${CUDA_VERSION}/bin${PATH:+:${PATH}}
	export LD_LIBRARY_PATH=/usr/local/cuda-${CUDA_VERSION}/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi

. /usr/local/anaconda3/etc/profile.d/conda.sh

export LC_ALL="en_US.UTF-8"
