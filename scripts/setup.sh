#!/usr/bin/env bash

# TODO: Check for OS and adjust accordingly

# TODO: Back up the current .zshrc file if found and replace/update it with the new contents

export CAN_ENV_SCRIPT_BASE=$(pwd);

OH_MY_ZSH_FOLDER="${HOME}/.oh-my-zsh";

export CAN_ENV_ROOT="${HOME}/.can-env";
export CAN_ENV_CONFIG_FOLDER="${CAN_ENV_ROOT}/configFiles";
chmod +x "${CAN_ENV_SCRIPT_BASE}"/*.sh;

cleanUp () {
  rm -rf "${CAN_ENV_ROOT}";
  rm -rf "${OH_MY_ZSH_FOLDER}";
  rm "${HOME}/.zshrc";
}


copyConfigFolder () {
  cp -r "${CAN_ENV_SCRIPT_BASE}/../configFiles/" "${CAN_ENV_ROOT}";
}

cleanUp;
copyConfigFolder;

"${CAN_ENV_SCRIPT_BASE}"/install-create-directory.sh;
"${CAN_ENV_SCRIPT_BASE}"/install-zwsh.sh;
