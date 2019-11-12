echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing oh-my-zsh.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)can-env: oh-my-zsh already installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing zsh-autosuggestions.$(tput sgr 0)"
echo "---------------------------------------------------------"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
