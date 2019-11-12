                       INSTALLDIR=$PWD

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Backup up current files.$(tput sgr 0)"
echo "---------------------------------------------------------"

# Backup files that are provided by the can-env into a ~/$INSTALLDIR-backup directory
BACKUP_DIR=$INSTALLDIR/backup

set -e # Exit immediately if a command exits with a non-zero status.

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Creating backup directory at $BACKUP_DIR.$(tput sgr 0)"
echo "---------------------------------------------------------"
mkdir -p $BACKUP_DIR

files=("$HOME/.config/nvim" "$HOME/.zshrc" "$HOME/.tmux.conf")
for filename in "${files[@]}"; do
    if [[ ! -L $filename ]]; then
      echo "---------------------------------------------------------"
      echo "$(tput setaf 2)can-env: Backing up $filename.$(tput sgr 0)"
      echo "---------------------------------------------------------"
      mv $filename $BACKUP_DIR || true
    else
      echo "---------------------------------------------------------"
      echo -e "$(tput setaf 3)can-env: $filename does not exist at this location or is a symlink.$(tput sgr 0)"
      echo "---------------------------------------------------------"
    fi
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Backup completed.$(tput sgr 0)"
echo "---------------------------------------------------------"
