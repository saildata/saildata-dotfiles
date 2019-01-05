#
# ~/.bashrc
#

# If not running interactively, don't do anything
#------------------------------------------------
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

# Set default envs
#-----------------
export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.node_modules/bin:/usr/local/bin:/usr/lib:/var/lib/pacman:${PATH}"


# Tilix fix for vte.sh
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi


# Load files from ~/.bashrc.d
source "${HOME}"/.config/.bashrc.d/aliases
source "${HOME}"/.config/.bashrc.d/variables
source "${HOME}"/.config/.bashrc.d/

export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME="$HOME"/.local/share

export HISTCONTROL=ignoreboth

export stmhome="$HOME"/.local/share/Steam/steamapps/common

#npm
export npm_config_prefix=~/.node_modules

export SYSTEMD_EDITOR=vim
export SYSTEMD_PAGER=less
export SYSTEMD_LESS=FRXMKi
export EDITOR=vim
export SUDO_EDITOR=vim
export VISUAL=vim
export HISTFILESIZE=1000
export LESS='-m -i -R -X -P%t?f%f :stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'
export LESSHISTFILE='/dev/null'
export LESSQUIET=1
#export LESSCOLORIZER='pygmentize'
export S_COLORS=always

# MISC/OTHER
#-----------
alias ..='cd ..'
alias ...='cd ../..'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias c='clear'
alias e='exit'

alias ..='cd ..'
alias c='clear'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# LS & Friends
#--------------
alias l='ls -lAhF --color=auto'
alias lx='ls -lXhBF --color=auto'         #  lx   -> Sort by EXTENSION.

#alias lss='ls -lShrF --color=auto'       #  lss   -> Sort by SIZE, biggest last.
alias lss='find . -readable -maxdepth 1 -exec du -sh {} \; 2>/dev/null| sort -h'

alias lt='ls -lAtrhF --color=auto'        #  lt   -> Sort by MODIFIED TIME, most recent last (bottom of stack).
alias ltr='ls -lAthF --color=auto'        #  ltr   -> Sort by MODIFIED TIME, most recent shown first (top of stack).

alias poweroff='systemctl poweroff'
alias lsd="ls -lF --color | grep /$"      #  lsd   -> list directories

# Source scripts for:
#--------------------
source ~/.functions

source ~/.bash_profile

source /usr/share/bash-completion/bash_completion

source /usr/bin/liquidprompt

#source /usr/lib/node_modules/tldr/bin/autocompletion.bash


# LS Colors
eval $(dircolors -b /usr/share/LS_COLORS/LS_COLORS)

# BAT env
export BAT_THEME="Monokai Extended"
export BAT_STYLE="full"

# vim: ft=sh
