#
# Executes commands at the start of an interactive session.
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
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/webdizz/.google-cloud-sdk/path.zsh.inc' ]; then source '/Users/webdizz/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/webdizz/.google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/webdizz/.google-cloud-sdk/completion.zsh.inc'; fi

if [ -d '/usr/local/opt/mysql-client/bin' ]; then export PATH="/usr/local/opt/mysql-client/bin:$PATH"; fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/webdizz/.sdkman"
[[ -s "/Users/webdizz/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/webdizz/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="${HOME}/.nodenv/shims:$PATH:/opt/homebrew/bin"
