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
## Helpful functions
##

## Grep entire history
hgrep () { fc -Dlim "*$@*" 1 }

## Remove a component from the curent PATH
path_remove () { PATH=$(echo $PATH | tr "\n" "*" | tr ":" "\n" | grep -v $1 | tr "\n" ":" | cut -d "*" -f 1) }

## Turn off pyenv in the current shell
nopyenv () {
  unset -f pyenv
  unset -f _pyenv
  unset -f _pyenv_virtualenv_hook
  path_remove pyenv
}


##
## Micellaneous
##
export ANSIBLE_DEPRECATION_WARNINGS=False
export VAGRANT_DEFAULT_PROVIDER="parallels"
export VAGRANT_DOTFILE_PATH="${HOME}/Virtual Machines.localized/Vagrant"
export PATH="${HOME}/bin:$PATH"
export SUDO_ASKPASS="${HOME}/bin/op-sudo"


##
## Find homebrew installation
##
if [ -f ${HOME}/.homebrew/bin/brew ] ; then
  eval "$(${HOME}/.homebrew/bin/brew shellenv)"
elif [ -f /opt/homebrew/bin/brew ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
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
