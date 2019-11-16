#!/usr/bin/env bash

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Linking symlink files.$(tput sgr 0)"
echo "---------------------------------------------------------"

linkables=$( find -H "$INSTALLDIR" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
  target="$HOME/.$( basename $file '.symlink' )"
  if [ -e $target ]; then
    echo "---------------------------------------------------------"
    echo "$(tput setaf 3)can-env: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
    echo "---------------------------------------------------------"
  else
    echo "---------------------------------------------------------"
    echo "$(tput setaf 2)can-env: Creating symlink for $file.$(tput sgr 0)"
    echo "---------------------------------------------------------"
    ln -s $file $target
  fi
done

linkables=$( find -H "$INSTALLDIR" -maxdepth 3 -name '*.zsh-theme' )
for file in $linkables ; do
  target="$HOME/.oh-my-zsh/themes/$( basename $file )"

  if [ -e $target ]; then
    echo "---------------------------------------------------------"
    echo "$(tput setaf 3)can-env: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
    echo "---------------------------------------------------------"
  else
    echo "---------------------------------------------------------"
    echo "$(tput setaf 2)can-env: Creating symlink for $file.$(tput sgr 0)"
    echo "---------------------------------------------------------"
    ln -s $file $target
  fi
done


if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)can-env: Installing config files.$(tput sgr 0)"
echo "---------------------------------------------------------"

for config in $INSTALLDIR/config/*; do
  target=$HOME/.config/$( basename $config )
  if [ -e $target ]; then
    echo "---------------------------------------------------------"
    echo "$(tput setaf 3)can-env: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
    echo "---------------------------------------------------------"
  else
    echo "---------------------------------------------------------"
    echo "$(tput setaf 2)can-env: Creating symlink for ${config}.$(tput sgr 0)"
    echo "---------------------------------------------------------"
    ln -s $config $target
  fi
done
