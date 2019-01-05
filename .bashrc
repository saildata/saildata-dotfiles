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

# Source scripts for:
#--------------------
source ~/.functions

source ~/.bash_profile

source /usr/share/bash-completion/bash_completion

source /usr/bin/liquidprompt

# LS Colors
eval $(dircolors -b /usr/share/LS_COLORS/LS_COLORS)

# BAT env
export BAT_THEME="Monokai Extended"
export BAT_STYLE="full"

# vim: ft=sh
