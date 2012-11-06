if [ ! "$HOME" ]
then
  echo "Need a \$HOME."
  exit 1
fi

echo "Setting up dot files."

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

