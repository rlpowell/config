#!/bin/bash

# Error trapping from https://gist.github.com/oldratlee/902ad9a398affca37bfcfab64612e7d1
__error_trapper() {
  local parent_lineno="$1"
  local code="$2"
  local commands="$3"
  echo "error exit status $code, at file $0 on or near line $parent_lineno: $commands"
}
trap '__error_trapper "${LINENO}/${BASH_LINENO}" "$?" "$BASH_COMMAND"' ERR

set -euE -o pipefail
shopt -s failglob

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

diffs=""
for file in $(pwd)/dotfiles/*
do
  echo "- Processing $file"
  short=$(basename $file)

  dotfile="$HOME/.$short"

  if [ -d "$file" ]
  then
    # Directory
    if [ \( ! -e "$dotfile" \) -o -L "$dotfile" -o "$1" = "-f" ]
    then
      ln -sfT "config/dotfiles/$short" "$dotfile"
    else
      echo "Please move/remove $dotfile ; I'm trying to replace it with a symlink to a directory ( $HOME/config/dotfiles/$short )"
      exit
    fi
  else
    # Regular file
    if [ -e "$dotfile" -a ! -h "$dotfile" ]
    then
      if [ "$1" = "-f" ]
      then
        echo "File $dotfile already exists, but in force mode; removing."
        /bin/rm $dotfile
      else
        diffs=1
        echo "File $dotfile already exists; diffs: "
        vimdiff "$file" "$dotfile"
        continue
      fi
    fi

    ln -sf "config/dotfiles/$short" "$dotfile"
  fi
done

if [ $diffs ]
then
  echo "Diffs were found.  Fix and run again with -f."
  exit 1
fi

echo "Setting up bin files"
mkdir -p $HOME/bin

for file in $(pwd)/binfiles/*
do
  echo "- Processing $file"
  short=$(basename $file)
  binfile="$HOME/bin/$short"

  if [ -e "$binfile" -a ! -h "$binfile" ]
  then
    if [ "$1" = "-f" ]
    then
      echo "File $binfile already exists, but in force mode; removing."
      /bin/rm $binfile
    else
      echo "File $binfile already exists; diffs: "
      vimdiff "$file" "$binfile"
      continue
    fi
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
if ! crontab -l | grep 'NO UPGRADE CRON'
then
  cronfile_orig=/tmp/cron.$$
  cronfile_new=/tmp/cron.$$.new
  crontab -l >$cronfile_orig
  grep -v "$(pwd)" $cronfile_orig >$cronfile_new
  echo "1 1 * * * $(pwd)/upgrade.sh" >> $cronfile_new
  diff $cronfile_orig $cronfile_new || true
  crontab $cronfile_new
fi

# Todo list recurrence
if [ -f $HOME/Dropbox/Private/todo/recur.txt ]
then
  cronfile_orig=/tmp/cron.$$
  cronfile_new=/tmp/cron.$$.new
  crontab -l >$cronfile_orig
  grep -v "Dropbox/Private/todo" $cronfile_orig >$cronfile_new
  echo "2 2 * * * $HOME/Dropbox/Private/todo/todo.sh recur" >> $cronfile_new
  diff $cronfile_orig $cronfile_new || true
  crontab $cronfile_new
fi

# Saving tmux state
if [ -x "$(which --skip-alias --skip-functions tmux)" ]
then
  cronfile_orig=/tmp/cron.$$
  cronfile_new=/tmp/cron.$$.new
  crontab -l >$cronfile_orig
  grep -v "save_tmux" $cronfile_orig >$cronfile_new
  echo "3 3 * * * $HOME/bin/save_tmux" >> $cronfile_new
  diff $cronfile_orig $cronfile_new || true
  crontab $cronfile_new
fi

echo "Running upgrade to install other things."

$HOME/config/upgrade.sh

# We don't want to use the exit value, and it upsets docker if the last command happens to go poorly.
exit 0
