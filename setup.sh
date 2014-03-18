#!/bin/bash

# Sets a computer up for me to use.
# Installs several essential packages and links dotfiles
# to their appropriate places in the filesystem.

basedir=$PWD

# Install the core of my toolset.
sudo apt-get install --force-yes -y  git-core bzr mercurial python-virtualenv python-pip zsh tmux conky vim-nox vim-gtk terminator

# Vim settings.
mv ~/.vimrc ~/.vimrc-old
ln -s $PWD/vim/vimrc ~/.vimrc
ln -s $PWD/vim ~/.vim

# Make sure to update vim pathogen bundles.
cd ~/.vim/bundle
git submodule init && git submodule update
cd $basedir

# Conky.
mv ~/.conkyrc ~/.conkyrc-old
ln -s $PWD/conky/conkyrc ~/.conkyrc

# tmux
mv ~/.tmux.conf ~/.tmux.conf-old
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf

# Chrome.
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install --force-yes -y google-chrome-stable

# Zsh + oh-my-zsh.
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mv ~/.zshrc ~/.zshrc-old
ln -s $PWD/zsh/zshrc ~/.zshrc

# Terminator
mkdir ~/.config/terminator
ln -s $PWD/terminator/config ~/.config/terminator/config
