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

echo "Setting up dot files"

for file in $(pwd)/dotfiles/*
do
  echo "- Processing $file"
  short=$(basename $file)
  if [ $short == "vim" ]
  then
    continue
  fi

  dotfile="$HOME/.$short"

  if [ -e "$dotfile" -a ! -h "$dotfile" ]
  then
    echo "File $dotfile already exists; diffs: "
    vimdiff "$file" "$dotfile"
    continue
  fi

  ln -sf "config/dotfiles/$short" "$dotfile"
done

ln -sfT "config/dotfiles/vim" ~/.vim

echo "Setting up bin files"
mkdir -p $HOME/bin

for file in $(pwd)/binfiles/*
do
  echo "- Processing $file"
  short=$(basename $file)
  binfile="$HOME/bin/$short"

  if [ -e "$binfile" -a ! -h "$binfile" ]
  then
    echo "File $binfile already exists; diffs: "
    vimdiff "$file" "$binfile"
    continue
  fi

  ln -sf "../config/binfiles/$short" "$binfile"
done

echo "Setting up tpm"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]
then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

echo "Setting up cron"

# conf file upgrade.sh
cronfile_orig=/tmp/cron.$$
cronfile_new=/tmp/cron.$$.new
crontab -l >$cronfile_orig
grep -v "$(pwd)" $cronfile_orig >$cronfile_new
echo "1 1 * * * $(pwd)/upgrade.sh" >> $cronfile_new
diff $cronfile_orig $cronfile_new
crontab $cronfile_new

# Todo list recurrence
if [ -f $HOME/Dropbox/Private/todo/recur.txt ]
then
  cronfile_orig=/tmp/cron.$$
  cronfile_new=/tmp/cron.$$.new
  crontab -l >$cronfile_orig
  grep -v "Dropbox/Private/todo" $cronfile_orig >$cronfile_new
  echo "2 2 * * * $HOME/Dropbox/Private/todo/todo.sh recur" >> $cronfile_new
  diff $cronfile_orig $cronfile_new
  crontab $cronfile_new
fi

echo "Running upgrade to install other things."

$HOME/config/upgrade.sh
