if [ ! "$HOME" ]
then
  echo "Need a \$HOME."
  exit 1
fi
for file in gitconfig vimrc tmux.conf muttrc muttrc-gmail \
                        inputrc bash_profile bashrc zshenv \
                        zshrc
do
  dotfile="$HOME/.$file"
  gitfile="$(pwd)/$file"

  if [ -e "$dotfile" -a ! -h "$dotfile" ]
  then
    echo "File $dotfile already exists; diffs: "
    diff -U 5 "$gitfile" "$dotfile"
    continue
  fi

  ln -sf "$gitfile" "$dotfile"
done

ln -sfT "$(pwd)/vim" ~/.vim
# test -d ~/.vim/ || ln -sfT "$(pwd)/vim/" ~/.vim

# treed has this submoduled to https://github.com/joelthelion/autojump
#
# cd autojump
# ./install.sh --local
