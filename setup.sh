#!/usr/bin

# Sets a computer up for me to use.
# Installs several essential packages and links dotfiles
# to their appropriate places in the filesystem.

# All packages that need to be installed at the end of
# this script.
packages=""

# Vim settings.
ln -s $PWD/vim/vimrc ~/.vimrc
packages="$packages vim"

# Music player deamon and mopidy.
mkdir ~/.ncmpc
ln -s $PWD/ncmpc/config ~/.ncmpc/config
wget -q -O /etc/apt/sources.list.d/mopidy.list http://apt.mopidy.com/mopidy.list
packages="$packages mopidy ncmpc"

# Conky.
ln -s $PWD/conky/conkyrc ~/.conkyrc
packages="$packages conky"

# TODO: install virtualenv, virtualenvwrapper

# Other packages.
packages="$packages aptitude"

# Install ALL the packages.
apt-get update
apt-get install $packages

# Quit with a nice message.
echo "Everything is installed, make sure you set up the mopidy spotify settings correctly!\n"
