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

if [ -h "$HOME/.fzf.bash" ]
then
  rm "$HOME/.fzf.bash"
fi
if [ -h "$HOME/.fzf.zsh" ]
then
  rm "$HOME/.fzf.zsh"
fi

git pull
yes | vim -c ':PlugInstall' -c ':qa'
yes | vim -c ':PlugUpdate' -c ':qa'
yes | ~/.fzf/install

echo "Setting up tpm"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]
then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

echo "Fixing fzf for HOME portability"
sed -i "s:$HOME:\$HOME:g" ~/.fzf.*

cd ~/.tmux/plugins/tpm
git pull
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh
# This keeps resetting the main tmux binding on the AWS PMs
# tmux source ~/.tmux.conf
echo "If tmux things changed run: tmux source ~/.tmux.conf"
