# Autostart script executed after i3 config is loaded. Largely stolen from the
# default crunchbang openbox autostart script located in
# ~/.config/openbox/autostart.

## GNOME PolicyKit and Keyring
eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

## Volume control for systray
(sleep 2s && pnmixer) &

## Volume keys daemon
xfce4-volumed &

## Enable power management
xfce4-power-manager &

## Start Thunar Daemon
thunar --daemon &

## Start xscreensaver
xautolock -time 10 -locker 'slock' &

## Set keyboard settings - 250 ms delay and 25 cps (characters per second) repeat rate.
## Adjust the values according to your preferances.
xset r rate 250 25 &

## Turn on/off system beep
xset b off &

## Set the background
#feh --bg-tile ~/.background.img
feh  --bg-scale '/home/jaapz/images/wallpapers/nap.png' 
