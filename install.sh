#!/bin/sh
mv ~/.vim ~/.vim_old
mv ~/.vimrc ~/.vim_old

cp -r ../Vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
