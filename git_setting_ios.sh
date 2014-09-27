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
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'
