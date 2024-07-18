
shopt -s expand_aliases

alias cdep="cd $HOME/share/eprotect-devices"
alias cdecp="cd $HOME/share/eprotect-devices/deps/ecp"
# alias epdev="source $HOME/epdev/epdev-env.sh"
alias cdnv="cd ~/.config/nvim"
alias cdvnc="cd ~/share/vnc-client/fbvnc-my/fbvnc"
alias cddot="cd ~/share/dotfiles/"

alias l="ls -h1 --group-directories-first"
alias ll="ls -hl --group-directories-first"
alias lal="ls -hal --group-directories-first"

alias v="nvim"
alias nv="nvim"
#alias vim="nvim"
alias t="tmux"

# alias u22start="docker start u22-uv"
# alias u22stop="docker stop u22-uv"
# alias u22cmake="docker exec u22-uv /home/kit/share/ubuntu-cmake.sh"
# alias u22build="docker exec u22-uv /home/kit/share/ubuntu-build.sh"
# alias u22-vnc="docker exec -d u22-u /home/kit/share/ubuntu-vnc.sh"
# alias u22install="/home/kit/share/ep-install.sh"
# alias u22exec="docker exec -it u22-uv bash"

# alias u22gui-cmake="docker exec u22-uv /home/kit/share/gui/ubuntu-cmake.sh"
# alias u22gui-build="docker exec u22-uv /home/kit/share/gui/ubuntu-build.sh"

alias vpn="$HOME/vpn"
alias gcommit="git rev-parse --short HEAD"
alias gbranch="git rev-parse --abbrev-ref HEAD"

alias sshstart="sudo systemctl start sshd"

alias u22start="podman start u22kirk && podman exec -d u22kirk bash -c /opt/runvnc.sh"
alias u22stop="podman stop u22kirk"
alias u22cmake="podman exec u22kirk bash -c /home/kit/share/ubuntu-cmake.sh"
alias u22build="podman exec u22kirk bash -c /home/kit/share/ubuntu-build.sh"
alias u22install="podman exec u22kirk bash -c /home/kit/share/ubuntu-install.sh"
alias u22exec="podman exec -it --workdir=/home/kit/share u22kirk bash"

# alias ubuntu="cd ~/quickemu && quickemu --vm ubuntu-22.04.conf --public-dir /home/kit/share"
alias ubuntu="incus exec --user=1001 --group=1001 --env=HOME=/home/kit ubuntu -- bash"

