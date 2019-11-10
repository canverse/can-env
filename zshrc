# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export CAN_ENV_ROOT="${HOME}/.can-env/";
export CAN_ENV_CONFIG_FOLDER="${CAN_ENV_ROOT}/configFiles";

export OH_MY_ZSH_CUSTOM_FOLDER="${ZSH}/custom";
export OH_MY_ZSH_THEMES_FOLDER="${OH_MY_ZSH_CUSTOM_FOLDER}/themes";
export OH_MY_ZSH_PLUGINS_FOLDER="${OH_MY_ZSH_CUSTOM_FOLDER}/plugins";


ZSH_THEME="powerlevel10k/powerlevel10k"

# THEME SETUP
# --------------
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs);
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator time);
# Add a space in the first prompt
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'


plugins=(
  git
  zsh-autosuggestions
)


source $ZSH/oh-my-zsh.sh

# Colorise the top Tabs of Iterm2 with the same color as background
# Just change the 18/26/33 wich are the rgb values
echo -e "\033]6;1;bg;red;brightness;18\a"
echo -e "\033]6;1;bg;green;brightness;26\a"
echo -e "\033]6;1;bg;blue;brightness;33\a"


source ${OH_MY_ZSH_PLUGINS_FOLDER}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
