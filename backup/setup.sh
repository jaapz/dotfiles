#!/bin/bash

# This script simply adds a crontab entry for a 2-minute backup through unison.
# It installs unison too. Unison syncs the files bi-directionally.
# You should have a backup ssh key created in /home/jaapz/.ssh/backup/id_rsa
# (generated using ssh-keygen -t rsa).

sudo apt-get install unison
mkdir ~/synced

{ crontab -l -u jaapz; echo '*/2 * * * * unison -auto -batch -confirmbigdel=false -sshargs "-i /home/jaapz/.ssh/backup/id_rsa" ~/synced ssh://broekhuizen.nu//home/jaapz/backup'; } | crontab -u jaapz -
