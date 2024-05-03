#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


if [ -e $HOME/.bash_custom ]; then
    source $HOME/.bash_custom
fi

if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

