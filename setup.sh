#!/bin/bash

# Sets a computer up for me to use.
# Installs several essential packages and links dotfiles
# to their appropriate places in the filesystem.

# We seriously need these packages for some commands in this script.
apt-get install -y  git-core bzr mercurial;

# All packages that need to be installed at the end of
# this script.
packages="";

# Vim settings.
mv ~/.vimrc ~/.vimrc-old
ln -s $PWD/vim/vimrc ~/.vimrc;
packages="$packages vim";

# Music player deamon and mopidy.
mv ~/.ncmpc ~/.ncmpc-old
mkdir ~/.ncmpc;
ln -s $PWD/ncmpc/config ~/.ncmpc/config;
wget -q -O /etc/apt/sources.list.d/mopidy.list http://apt.mopidy.com/mopidy.list;s
packages="$packages mopidy ncmpc";

# Conky.
mv ~/.conkyrc ~/.conkyrc-old
ln -s $PWD/conky/conkyrc ~/.conkyrc;
packages="$packages conky";

# Chrome.
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -;
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list';
packages="$packages google-chrome-beta";

# Zsh + oh-my-zsh.
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh;
mv ~/.zshrc ~/.zshrc-old;
ln -s $PWD/zsh/zshrc ~/.zshrc;
packages="$packages zsh";

# Terminator
mkdir ~/.config/terminator;
ln -s $PWD/terminator/config ~/.config/terminator/config;
packages="$packages terminator";

# TODO: install virtualenv, virtualenvwrapper

# Other packages.
packages="$packages aptitude";

echo "Installing packages: $packages";

# Install ALL the packages.
apt-get update;
apt-get install -y $packages;

# Quit with a nice message.
echo "Everything is installed, make sure you set up the mopidy spotify settings correctly!";
