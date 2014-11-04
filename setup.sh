#!/bin/bash

# Sets a computer up for me to use.
# Installs several essential packages and links dotfiles
# to their appropriate places in the filesystem.

basedir=$PWD

# Install the core of my toolset.
sudo apt-get install --force-yes -y  git-core bzr mercurial python-virtualenv python-pip zsh tmux conky vim-nox vim-gtk terminator i3 feh

# useful scripts
mv ~/bin ~/oldbin
ln -s $PWD/bin ~/bin
mv ~/oldbin/* ~/bin

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

# Zsh + oh-my-zsh.
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mv ~/.zshrc ~/.zshrc-old
ln -s $PWD/zsh/zshrc ~/.zshrc

# Terminator
mkdir ~/.config/terminator
ln -s $PWD/terminator/config ~/.config/terminator/config

# i3wm
mkdir ~/.i3
ln -s $PWD/i3/config ~/.i3/config
ln -s $PWD/i3/my-conky-i3bar-script.sh ~/.my-conky-i3bar-script.sh
ln -s $PWD/i3/i3status.conf ~/.i3status.conf

# mutt
ln -s $PWD/mutt ~/.mutt
ln -s $PWD/mutt/muttrc ~/.muttrc

# offlineimap
ln -s $PWD/offlineimap/offlineimaprc ~/.offlineimaprc

# xinitrc
mv ~/.xinitrc ~/.xinitrc-old
ln -s $PWD/xinit/xinitrc ~/.xinitrc
