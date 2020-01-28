#!/bin/bash

set -o errexit

GRAY="\033[37m"
GREEN="\033[32m"
RED="\033[31m"
END_COLOR="\033[0m"

if [[ $1 ]]; then
    user=$1
    root_ran=true
else
    user=$USER
    root_ran=false
fi

DIR="$( dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" )"
USER_HOME=$(eval echo ~$user)

attempt () {
    output=$(eval $1 2>&1)

    if [[ $? != 0 ]]; then
        echo -e $RED$1" failed:"$END_COLOR
        echo "$output"
        exit 1
    fi
}

cd $DIR

if [[ $1 ]]; then
    echo "Username specified - skipping initial setup."
else
    echo "Please ensure the following are installed:"
    echo -e $GRAY" - gcc"$END_COLOR
    echo -e $GRAY" - zsh"$END_COLOR
    echo -e $GRAY" - vim"$END_COLOR
    echo -e $GRAY" - tmux"$END_COLOR

    echo "Updating dotfiles and dependencies..."

    # Update dotfiles submodules
    git submodule update --init --recursive

    echo -e $GREEN"   done!"$END_COLOR
fi

echo "Symlinking configuration files..."

CONFIG_FILES=(
    "config/nvim/init.vim"
    "irssi"
    "tmux"
    "tmux.conf"
    "tmuxline.conf"
    "zsh"
    "zshrc"
)

for f in ${CONFIG_FILES[@]}; do
    if [[ ! -L $USER_HOME/.$f ]]; then
        if [[ -e $USER_HOME/.$f ]]; then
            read -p "Overwrite $USER_HOME/.$f? (y/n): " -n 1
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                echo "Leaving $USER_HOME/.$f alone!"
                continue
            fi
        fi

        rm -fr $USER_HOME"/."$f
        ln -fsv "$DIR/$f" "$USER_HOME/.$f"
        chown -h "$user" "$USER_HOME/.$f"
        chgrp -h "$user" "$USER_HOME/.$f" || echo "[warn] Could not chgrp $user $USER_HOME/.$f!"
    fi
done

echo -e $GREEN"   done!"$END_COLOR

rm "$USER_HOME"/.zcompdump* || true

find zsh -type d -exec chmod 755 {} \;
find zsh -type f -exec chmod 644 {} \;
