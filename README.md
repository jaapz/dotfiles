Jaapz's Dotfiles
================

This repository contains most of my dotfiles and other config files, and
it also contains a setup script to automatically install all the packages
i mostly use. The script also links to dot and config files in this repo
to their appropriate places in the filesystem.

The script does require root powers, so to run it you'd do:

    sudo ./setup.sh

Passwords
=========

I encrypt my password files using openssl. To create an encrypted password file,
do:

   echo "mypassword" > ~/.gmail-password.before
   cat ~/.gmail-password.before | openssl rsautl -encrypt -pubin -inkey ~/.ssh/id_rsa.pub.pem > ~/.gmail-password
   rm ~/.gmail-password.before

My encrypted password files are ~/.gmail-password and ~/.personal-password,
which are used by offlineimap (in `~/.offlineimaprc`) to authenticate to my mail
accounts.

License
=======

If anyone would ever like to use any of the configs and dotfiles in this
repo, that is no problem at all. Just to be sure i hereby declare that
under the powers invested in me by myself, this repo is available in the
public domain. Do what you want with it. And if something of yours breaks when
using any of the scripts in this repository, that is totally and completely your
own fault, not mine.
