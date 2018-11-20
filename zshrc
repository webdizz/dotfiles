#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
compctl -g '~/.teamocil/*(:t:r)' teamocil

fpath=(/opt/boxen/homebrew/share/zsh-completions $fpath)

fpath=(~/.zsh $fpath)

autoload -Uz compinit
compinit
# End of lines added by compinstall

# for Ubuntu there is no package, it can be installed like this:  sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/local/share/zsh-autosuggestions/
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# added by travis gem
[ -f /Users/webdizz/.travis/travis.sh ] && source /Users/webdizz/.travis/travis.sh
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/webdizz/.google-cloud-sdk/path.zsh.inc' ]; then source '/Users/webdizz/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/webdizz/.google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/webdizz/.google-cloud-sdk/completion.zsh.inc'; fi
