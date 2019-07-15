#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Set default envs
#-----------------
export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.node_modules/bin:${HOME}/projects/git-extra-commands/bin:/usr/lib:/var/lib/pacman:${PATH}"

# Load files from ~/.bashrc.d
source "${HOME}"/.config/bashrc.d/aliases
source "${HOME}"/.config/bashrc.d/functions
source "${HOME}"/.config/bashrc.d/shell-options
source "${HOME}"/.config/bashrc.d/variables
source "${HOME}"/.config/bashrc.d/completions/cht.sh

# Source scripts for:
#--------------------
source /usr/share/bash-completion/bash_completion

# LS Colors
eval $(dircolors -b /usr/share/LS_COLORS/LS_COLORS)

# START bash-it stuff
# -------------------
# Path to the bash it configuration
export BASH_IT="/home/srw/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='zork'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
