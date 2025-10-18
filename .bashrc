##
## .bashrc
##
## (c) 2020-2025 Stephen L. Ulmer
##

##
## Source global definitions
##
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


##
## bash behavioral configuration
##
export BASH_SILENCE_DEPRECATION_WARNING=1
export HISTSIZE=10000
export PS1="[\u@\h \W]\\$ "


##
## Load common configuration for bash and zsh
##
if [ -f "$HOME/.commonrc" ] ; then
  . $HOME/.commonrc
fi
