#!/bin/bash

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installation starting.$(tput sgr 0)"
echo "---------------------------------------------------------"

INSTALLDIR=$PWD # Make this configurable
mkdir -p $HOME/.local/share/nvim/backup # This is going to be used as a backup folder for nvim

unamestr=`uname`;

if [[ "$unamestr" == 'Darwin' ]]; then
    source "scripts/setup-system-packages.mac.sh"
    source "scripts/setup-fonts.mac.sh"

elif [[ "$unamestr" == 'Linux' ]]; then
    echo "Linux support incoming"
    source "scripts/setup-system-packages.mac.sh"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing asdf.$(tput sgr 0)"
echo "---------------------------------------------------------"
source scripts/setup-asdf.sh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing languages packages.$(tput sgr 0)"
echo "---------------------------------------------------------"
source scripts/setup-packages.sh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing oh-my-zsh.$(tput sgr 0)"
echo "---------------------------------------------------------"
source scripts/setup-zsh.sh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing Neovim plugins and linking dotfiles.$(tput sgr 0)"
echo "---------------------------------------------------------"
source scripts/setup-nvim.sh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing tmux plugin manager.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Switching shell to zsh. You may need to logout.$(tput sgr 0)"
echo "---------------------------------------------------------"

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: System update complete. Currently running at 100% power. Enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0




