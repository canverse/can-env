
echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing system fonts.$(tput sgr 0)"
echo "---------------------------------------------------------"

brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
brew cask install font-meslo-for-powerline
brew cask install font-meslo-lg
