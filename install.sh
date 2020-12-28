#!/bin/bash

# Thanks to P1x3l for the initial setup!
# Go to your home directory
cd ~

# Backup your existing vim, zsh and tmux configs if they already exist
files="
  .vim
  .zshrc
  .vimrc
  .tmux.conf
"
for f in $files
do
  if [[ -f $f || -d $f ]]
  then
    mv $f "$f".old
    echo "$f moved to $f.old"
  else
    echo "$f does not exist"
  fi
done

# Hide dotfiles folder if it has not been made correctly from installation step 1
if [[ -d "dotfiles" ]]
then
  mv dotfiles .dotfiles
fi

# Create symlinks for your new configuration
ln -s .dotfiles/tmux.conf .tmux.conf &&
ln -s .dotfiles/vimrc .vimrc &&
ln -s .dotfiles/vim .vim &&
ln -s .dotfiles/zshrc .zshrc
