#!/bin/bash

# This script simply adds a crontab entry for a 2-minute backup through unison.
# It installs unison too. Unison syncs the files bi-directionally.

sudo apt-get install unison

{ crontab -l -u jaapz; echo '*/2 * * * * unison ~/synced ssh://broekhuizen.nu//home/jaapz/backup -auto -batch'; } | crontab -u jaapz -
