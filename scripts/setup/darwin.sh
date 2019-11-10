#!/usr/bin/env bash

# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
#ORIGINAL_IFS=$IFS
IFS=$'\t\n' # Stricter IFS settings

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_is_installed() {
  local name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

brew_is_upgradable() {
  local name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$name" >/dev/null
}

brew_tap() {
  brew tap "$1" 2> /dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_launchctl_restart() {
  local name="$(brew_expand_alias "$1")"
  local domain="homebrew.mxcl.$name"
  local plist="$domain.plist"

  fancy_echo "Restarting %s ..." "$1"
  mkdir -p "$HOME/Library/LaunchAgents"
  ln -sfv "/usr/local/opt/$name/$plist" "$HOME/Library/LaunchAgents"

  if launchctl list | grep -Fq "$domain"; then
    launchctl unload "$HOME/Library/LaunchAgents/$plist" >/dev/null
  fi
  launchctl load "$HOME/Library/LaunchAgents/$plist" >/dev/null
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    fancy_echo "Updating %s ..." "$1"
    gem update "$@"
  else
    fancy_echo "Installing %s ..." "$1"
    gem install "$@"
  fi
}

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    export PATH="/usr/local/bin:$PATH"
else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Updating Homebrew formulas ..."
brew update

DOTFILES_DIR=$HOME/can-env

brew_install_or_upgrade 'zsh'
brew_install_or_upgrade 'git'
brew_install_or_upgrade 'the_silver_searcher'
brew_install_or_upgrade 'vim'
brew_install_or_upgrade 'ctags'
brew_install_or_upgrade 'tmux'
$DOTFILES_DIR/scripts/setup/tmux.sh
brew_install_or_upgrade 'imagemagick'
brew_install_or_upgrade 'qt'
brew_install_or_upgrade 'shellcheck'
brew_install_or_upgrade 'telnet'

# For Ruby
brew_install_or_upgrade readline

# For various languages that use OpenSSL
brew_install_or_upgrade 'openssl'
brew unlink openssl && brew link openssl --force

brew_install_or_upgrade 'libyaml'

# Exuberant Ctags
brew_install_or_upgrade ctags

# Install command-line JSON processor
brew_install_or_upgrade jq

# Install pandoc
brew_install_or_upgrade pandoc

# For JSON pretty printing in the quicklook window
brew cask install quicklook-json

# For watching for file change events
brew_install_or_upgrade entr

# Install GNU readlink
brew_install_or_upgrade coreutils

# Install GNU sed
brew_install_or_upgrade gnu-sed

# autoexpect
brew_install_or_upgrade expect

# Mosh for high latency remote servers
brew_install_or_upgrade mobile-shell

# For wrapping shells that don't use readline
brew_install_or_upgrade rlwrap

# For password management
brew_install_or_upgrade pass

# Elm for packages that require it
brew_install_or_upgrade elm

# For network troubleshooting
brew_install_or_upgrade mtr

# OSX alternative to `ps auxf` for process tree views
brew_install_or_upgrade pstree

# Required by asdf-nodejs
brew_install_or_upgrade gnupg

# Images in the terminal
brew_tap eddieantonio/eddieantonio
brew_install_or_upgrade imgcat

# Install tools for server testing and administration
brew_install_or_upgrade ansible

# For web server performance
brew_install_or_upgrade siege

# Install other software using custom install scripts
#run_install_scripts

###############################################################################
# Configure OSX
###############################################################################

#$HOME/dotfiles/scripts/setup/macos-defaults
