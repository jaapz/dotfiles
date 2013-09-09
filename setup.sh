#!/bin/bash

# Sets a computer up for me to use.
# Installs several essential packages and links dotfiles
# to their appropriate places in the filesystem.

basedir=$PWD

# We seriously need these packages for some commands in this script.
sudo apt-get install -y  git-core bzr mercurial;

# All packages that need to be installed at the end of
# this script.
packages=""

# Vim settings.
mv ~/.vimrc ~/.vimrc-old
ln -s $PWD/vim/vimrc ~/.vimrc
ln -s $PWD/vim ~/.vim
packages="$packages vim gvim"

# Make sure to update vim pathogen bundles.
cd ~/.vim/bundle
git submodule init && git submodule update
cd $basedir

# Music player deamon and mopidy.
mv ~/.ncmpc ~/.ncmpc-old
mkdir ~/.ncmpc
ln -s $PWD/ncmpc/config ~/.ncmpc/config
wget -q -O /etc/apt/sources.list.d/mopidy.list http://apt.mopidy.com/mopidy.list
packages="$packages mopidy ncmpc"

# Conky.
mv ~/.conkyrc ~/.conkyrc-old
ln -s $PWD/conky/conkyrc ~/.conkyrc
packages="$packages conky"

# tmux
mv ~/.tmux.conf ~/.tmux.conf-old
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf
packages="$pacakges tmux"

# Chrome.
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
packages="$packages google-chrome-beta"

# Zsh + oh-my-zsh.
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mv ~/.zshrc ~/.zshrc-old
ln -s $PWD/zsh/zshrc ~/.zshrc
packages="$packages zsh"

# Theme for zsh also needs hg-prompt.
hg clone http://bitbucket.org/sjl/hg-prompt/ ~/.hg-prompt
# TODO: add hgrc and add hg-promp as an extension.

# Terminator
mkdir ~/.config/terminator
ln -s $PWD/terminator/config ~/.config/terminator/config
packages="$packages terminator"

# TODO: install virtualenv, virtualenvwrapper

# Other packages.
packages="$packages aptitude"

echo "Installing packages: $packages"

# Install ALL the packages.
sudo apt-get update
sudo apt-get install --force-yes -y $packages

# Quit with a nice message.
echo "Everything is installed, make sure you set up the mopidy spotify settings correctly!"
