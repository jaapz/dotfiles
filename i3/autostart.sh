# Autostart script executed after i3 config is loaded. Largely stolen from the
# default crunchbang openbox autostart script located in
# ~/.config/openbox/autostart.

## GNOME PolicyKit and Keyring
eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

## Start Thunar Daemon
thunar --daemon &

## Turn off system beep
xset b off &

## Network manager.
nm-applet &

## Set the background
feh --bg-tile '/home/jaapz/Pictures/bg/dark_embroidery.png'
#feh  --bg-scale '/home/jaapz/images/wallpapers/nap.png' 
