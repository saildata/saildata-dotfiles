#
# ~/.bashrc
#

# If not running interactively, don't do anything
#------------------------------------------------
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

# remove default quit: ctrl+\
stty quit undef


# Set default envs
#-----------------
export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.node_modules/bin:${HOME}/projects/git-extra-commands/bin:/usr/lib:/var/lib/pacman:${PATH}"

# Tilix fix for vte.sh
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# Load files from ~/.bashrc.d
source "${HOME}"/.config/bashrc.d/aliases
source "${HOME}"/.config/bashrc.d/functions
source "${HOME}"/.config/bashrc.d/shell-options
source "${HOME}"/.config/bashrc.d/variables
source "${HOME}"/.config/bashrc.d/completions/cht.sh

# Source scripts for:
#--------------------

source /usr/share/bash-completion/bash_completion

source /usr/bin/liquidprompt

# LS Colors
eval $(dircolors -b /usr/share/LS_COLORS/LS_COLORS)

#export LS_COLORS="$(vivid generate ayu)"
