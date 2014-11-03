#! /usr/bin/bash

sudo apt-get install procmail fetchmail mutt offlineimap

# Set up mail config
mkdir ~/.procmail/
touch ~/logs/fetchmail.log

ln -s $PWD/procmail.conf ~/.procmail.conf
ln -s $PWD/fetchmail.conf ~/.fetchmail.conf

cat setup_final.txt
