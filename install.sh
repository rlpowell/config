if [ ! "$HOME" ]
then
  echo "Need a \$HOME."
  exit 1
fi

echo "Setting up submodules"
git submodule sync
git submodule init
git submodule update

echo "Setting up dot files"

for file in vimrc tmux.conf muttrc muttrc-gmail inputrc \
            bash_profile bashrc zshenv zshrc bash_logout
do
  dotfile="$HOME/.$file"
  gitfile="$(pwd)/dotfiles/$file"

  if [ -e "$dotfile" -a ! -h "$dotfile" ]
  then
    echo "File $dotfile already exists; diffs: "
    vimdiff "$gitfile" "$dotfile"
    continue
  fi

  ln -sf "$gitfile" "$dotfile"
done

ln -sfT "$(pwd)/dotfiles/vim" ~/.vim
# test -d ~/.vim/ || ln -sfT "$(pwd)/vim/" ~/.vim

# treed has this submoduled to https://github.com/joelthelion/autojump
#
# cd autojump
# ./install.sh --local


echo "Setting up bin files"

for file in cvim ws_trim_wrap
do
  binfile="$HOME/bin/$file"
  gitfile="$(pwd)/binfiles/$file"

  if [ -e "$binfile" -a ! -h "$binfile" ]
  then
    echo "File $binfile already exists; diffs: "
    vimdiff "$gitfile" "$binfile"
    continue
  fi

  ln -sf "$gitfile" "$binfile"
done

echo "Setting up cron"

cronfile_orig=/tmp/cron.$$
cronfile_new=/tmp/cron.$$.new
crontab -l >$cronfile_orig
grep -v $(pwd) $cronfile_orig >$cronfile_new
echo "1 1 * * * cd $(pwd) ; git pull ; git submodule init ; git submodule sync ; git submodule update" >> $cronfile_new
diff $cronfile_orig $cronfile_new
crontab $cronfile_new
