##
## .zshrc
##
## (c) 2020-2025 Stephen L. Ulmer
##


##
## zsh behavioral configuration
##

## zsh history options
setopt NO_LIST_BEEP
setopt NO_HIST_BEEP
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
HISTSIZE=10000

## zsh tab-completion options (more like bash)
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' path-completion false
zstyle ':completion:*' menu false
autoload -Uz compinit && compinit

if [ -f "${HOME}/.commonrc" ] ; then
  . ${HOME}/.commonrc
fi
