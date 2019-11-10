#!/bin/bash -

###############################################################################
# Set flags so script is executed in "strict mode"
###############################################################################

set -u # Prevent unset variables
set -e # Stop on an error
set -o pipefail # Pipe exit code should be non-zero when a command in it fails
#ORIGINAL_IFS=$IFS
IFS=$'\t\n' # Stricter IFS settings

install_or_upgrade() {
  apt-cyg -yq install "$@"
 # apt-cyg show "$@"
}

###############################################################################
# Install packages with apt-get
###############################################################################

# Make apt-get calls non-interactive
DEBIAN_FRONTEND=noninteractive
apt-cyg update
apt-cyg dos2unix

# General dependencies
install_or_upgrade autoconf

# Tools I need for development
# Add apt apt-get repository with latest version of Git
# sudo add-apt-repository ppa:git-core/ppa -y
install_or_upgrade git
install_or_upgrade zsh
install_or_upgrade curl

# other development tools
install_or_upgrade jq
# For watching for file change events
install_or_upgrade ansible

# For clipboard access on the command line
install_or_upgrade xsel

# VirtualBox for VMs
#sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib"
#wget -q -O - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
#sudo apt-get update
#install_or_upgrade virtualbox-5.2

# Shell script linting
# Communication apps
# install_or_upgrade weechat

# For the terminal
#sudo apt-get install fonts-inconsolata
# Visualization library
#install_or_upgrade graphviz


# Misc other dependencies
install_or_upgrade ncftp lftp

# Needed for tmux
install_or_upgrade libevent-dev

# Tree for directory structure
install_or_upgrade tree

# For wrapping shells that don't use readline
install_or_upgrade rlwrap

# Install xsane and dependencies
install_or_upgrade libsane libsane-extras sane-utils xsane
# Install other software using custom install scripts
# run_install_scripts

## This needs to be run after tmux installation
#$HOME/dotfiles/scripts/setup/tmux.sh
#
## Fix annoying pulseaudio settings, if not already there
## Taken from https://lobste.rs/s/kst05r/disable_flat_volume_for_pulseaudio
#if ! grep -c "flat-volumes = no" "$HOME/.pulse/daemon.conf"; then
#    echo "flat-volumes = no" >> "$HOME/.pulse/daemon.conf"
#fi
