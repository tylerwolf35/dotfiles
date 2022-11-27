# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

GUIX_PROFILE="/home/tyler/.guix-profile"
     . "$GUIX_PROFILE/etc/profile"

# TODO: Check if the user daemon is already started before run this command.
# shepherd

