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
