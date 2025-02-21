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

hgrep () { fc -Dlim "*$@*" 1 }


## zsh tab-completion options (more like bash)
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' path-completion false
zstyle ':completion:*' menu false
autoload -Uz compinit && compinit


##
## dotfile mode
##
## Set-up environment so that git(1) uses a private repodir and uses
## $HOME as the working tree.
##

## start dotfile mode
dotfilemode () {
  export GIT_DIR=$HOME/.dotfiles
  export GIT_WORK_TREE=$HOME
  precmd () {
    echo '===> DOTFILE MODE'
  }
}

## stop dotfile mode
nodotfilemode () {
  unset GIT_DIR
  unset GIT_WORK_TREE
  unset -f precmd
}


##
## Micellaneous
##
export ANSIBLE_DEPRECATION_WARNINGS=False
export ANSIBLE_STDOUT_CALLBACK=yaml
export VAGRANT_DEFAULT_PROVIDER="parallels"
export VAGRANT_DOTFILE_PATH="${HOME}/Virtual Machines.localized/Vagrant"
export PATH="${HOME}/bin:$PATH"


##
## Use private homebrew if it exists
##
if [ -f ${HOME}/.homebrew/bin/brew ] ; then
  eval "$(${HOME}/.homebrew/bin/brew shellenv)"
fi


##
## Enable Python, Ruby, Perl virtualenv shims
##
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which plenv > /dev/null; then eval "$(plenv init - zsh)"; fi


##
## Load OnePassword CLI plugins
##
if [ -f ${HOME}/.config/op/plugins.sh ] ; then
  source ${HOME}/.config/op/plugins.sh
fi
