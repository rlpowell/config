#!/bin/bash

if [ ! -d "dotfiles" ]
then
  cd ~/config/
fi

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

echo "Setting up tpm"
if [ ! -d "/home/rlpowell/.tmux/plugins/tpm" ]
then
  git clone https://github.com/tmux-plugins/tpm /home/rlpowell/.tmux/plugins/tpm
fi

cd ~/.tmux/plugins/tpm
git pull
/home/rlpowell/.tmux/plugins/tpm/scripts/install_plugins.sh
# This keeps resetting the main tmux binding on the AWS PMs
# tmux source ~/.tmux.conf
echo "If tmux things changed run: tmux source ~/.tmux.conf"
