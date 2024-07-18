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

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

. "$HOME/.cargo/env"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export LIBVIRT_DEFAULT_URI='qemu:///system'
