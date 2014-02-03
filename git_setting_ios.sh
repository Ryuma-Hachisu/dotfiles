#!/bin/sh
ln -s ~/dotfiles/.emacs_mac ~/.emacs
ln -s ~/dotfiles/.emacs.d_mac/ ~/.emacs.d
ln -s ~/dotfiles/.zlogin ~/.zlogin
ln -s ~/dotfiles/.screenrc ~/.screenrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# updatedb使えるようにする
alias updatedb='/usr/libexec/locate.updatedb'
git config --global color.ui auto
