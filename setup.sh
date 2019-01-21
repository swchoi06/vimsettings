#/bin/bash

echo "This script replaces the current vim settings!"
CURRENT_DIR=$PWD
BASE_DIR=$(dirname $0)

cd $BASE_DIR
git submodule init
git submodule update

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc_backup
fi
if [ -f ~/.config/.flake ]; then
  mv ~/.config/.flake ~/.config/.flake_old
fi

rm -rf ~/.vimrc
rm -rf ~/.vim/
rm -rf ~/.config/.flake
cp -R .vim ~/
cp -R .vimrc ~/
cp -R .flake ~/.config/

cd $CURRENT_DIR
