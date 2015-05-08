#!/bin/bash

if [ ! -d "dotfiles" ]
then
  echo "Run this from the config/ directory, please ; there should be a 'dotfiles' dir in the place you run this."
  exit 1
fi

if [ ! "$HOME" ]
then
  echo "Need a \$HOME."
  exit 1
fi

if [ -h "/home/rlpowell/.fzf.bash" ]
then
  rm "/home/rlpowell/.fzf.bash"
fi
if [ -h "/home/rlpowell/.fzf.zsh" ]
then
  rm "/home/rlpowell/.fzf.zsh"
fi

git pull
yes | vim -c ':PlugInstall' -c ':qa'
yes | vim -c ':PlugUpdate' -c ':qa'
yes | ~/.fzf/install

cd ~/.tmux/plugins/tpm
git pull
/home/rlpowell/.tmux/plugins/tpm/scripts/install_plugins.sh
