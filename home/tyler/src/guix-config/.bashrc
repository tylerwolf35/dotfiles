# Bash initialization for interactive non-login shells and
# for remote shells (info "(bash) Bash Startup Files").

# Export 'SHELL' to child processes.  Programs such as 'screen'
# honor it and otherwise use /bin/sh.
export SHELL

if [[ $- != *i* ]]
then
    # We are being invoked from a non-interactive shell.  If this
    # is an SSH session (as in "ssh host command"), source
    # /etc/profile so we get PATH and other essential variables.
    [[ -n "$SSH_CLIENT" ]] && source /etc/profile

    # Don't do anything else.
    return
fi

# Source the system-wide file.
source /etc/bashrc

# Adjust the prompt depending on whether we're in 'guix environment'.
if [ -n "$GUIX_ENVIRONMENT" ]
then
    PS1='\u@\h \w [env]\$ '
else
    PS1='\u@\h \w\$ '
fi
alias ls='ls -p --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'

alias icat="kitty +kitten icat"


function rbwc() { rbw get $1 | tr -d "\n" | xclip -selection clipboard; }

# export GUIX_SANDBOX_HOME='/media/S70 Blade/ steam'

# flatpak dirs
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/home/tyler/.local/share/flatpak/exports/share

# path
export PATH=$PATH:/home/tyler/bin
export PATH=$PATH:/home/tyler/.local/bin
export PATH=$PATH:/home/tyler/node_modules/.bin
export PATH=$PATH:/home/tyler/.cargo/bin

# LD_LIBRRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tyler/.guix-profile/lib

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(/home/tyler/.rbenv/bin/rbenv init - bash)"
