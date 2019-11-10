# TODO: This is for OS X for now, have to update for other platforms

brew install zsh zsh-completions;

## oh-my-zsh setup
OH_MY_ZSH_FOLDER="${HOME}/.oh-my-zsh";
OH_MY_ZSH_CUSTOM_FOLDER="${OH_MY_ZSH_FOLDER}/custom";
OH_MY_ZSH_THEMES_FOLDER="${OH_MY_ZSH_CUSTOM_FOLDER}/themes";
OH_MY_ZSH_PLUGINS_FOLDER="${OH_MY_ZSH_CUSTOM_FOLDER}/plugins";

gitClone () {
  local GIT_URL=$1;
  local TARGET_PATH=$2;
  local NAME=$3;

  if [ ! -d "${TARGET_PATH}" ] ; then
    git clone "${GIT_URL}" "${TARGET_PATH}";
  else
      echo "${NAME} is already installed, pulling the latest version...";
      git -C "${TARGET_PATH}" pull "${GIT_URL}";
  fi
}

if [ ! -d "${OH_MY_ZSH_FOLDER}" ] ; then
    curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash;
else
    echo "oh-my-zsh already installed"; # Should I prompt for repull?
fi

## oh-my-zsh powerlevel9k theme setup
POWER_LEVEL_10K_GIT_URL="https://github.com/romkatv/powerlevel10k.git";
gitClone $POWER_LEVEL_10K_GIT_URL "${OH_MY_ZSH_THEMES_FOLDER}/powerlevel10k" "powerlevel10k";

## zsh-autosugestions
ZSH_SUGGESTIONS_GIT_URL="https://github.com/zsh-users/zsh-autosuggestions";
gitClone $ZSH_SUGGESTIONS_GIT_URL "${OH_MY_ZSH_PLUGINS_FOLDER}/zsh-autosuggestions" "zsh-autosuggestions";


## zsh-syntax-highlighting
ZSH_SYNTAX_HIGHLIGHTING_GIT_URL="https://github.com/zsh-users/zsh-syntax-highlighting.git";
gitClone $ZSH_SYNTAX_HIGHLIGHTING_GIT_URL "${OH_MY_ZSH_PLUGINS_FOLDER}/zsh-syntax-highlighting" "zsh-syntax-highlighting";

