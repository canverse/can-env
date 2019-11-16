source scripts/backup.sh
source scripts/link.sh
nvim +PlugInstall +qall || true
nvim +UpdateRemotePlugins +qall || true

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing Space vim-airline theme.$(tput sgr 0)"
echo "---------------------------------------------------------"

# Disable this for palelight
# cp ~/.config/nvim/space.vim ~/.config/nvim/plugged/vim-airline-themes/autoload/airline/themes/space.vim
