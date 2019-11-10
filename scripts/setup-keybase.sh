#!/bin/bash -
###############################################################################
# setup.sh
# This script creates everything needed to get started on a new laptop
###############################################################################

# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\t\n' # Stricter IFS settings
ORIGINAL_IFS=$IFS

if [[ -d '/keybase/private/' ]]; then
  # Assuming logged in and correctly structered after this
  # Should document this
  echo "Importing ssh key(s) and configuration..."
  ln -s /keybase/private/*/ssh/* ~/.ssh
  chmod -R 700 ~/.ssh
else
  echo "Couldn't find keybase installation, add the necessary ssh keys and config files manually under ~/.ssh"
fi
