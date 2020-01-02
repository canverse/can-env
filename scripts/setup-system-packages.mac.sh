echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Checking for Homebrew installation.$(tput sgr 0)"
echo "---------------------------------------------------------"
brew=`(which brew)`
if [ -f "$brew" ]
then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)can-env: Homebrew is installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 3)can-env: Installing Homebrew. Homebrew requires osx command lines tools, please download xcode first$(tput sgr 0)"
  echo "---------------------------------------------------------"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing system packages.$(tput sgr 0)"
echo "---------------------------------------------------------"

packages=(
  "git"
  "tmux"
  "neovim"
  "zsh"
  "ripgrep"
  "fzf"
  "z"
  "gpg"
  "direnv"
)

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done

