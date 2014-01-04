#!/bin/bash

DIR="$( dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" )"

if [ -z "$1" ]; then
    USER_NAME=$SUDO_USER
else
    USER_NAME=$1
fi

USER_HOME=$(eval echo ~${USER_NAME})

if [ "$UID" -ne 0 ]; then
    echo "Must be root to run this script."
    exit
fi

echo "Installing system dependencies..."

# Essential dependencies
apt-get install zsh vim

# YouCompleteMe dependencies
apt-get install vim-nox build-essential cmake python-dev

echo "Updating dotfiles and dependencies..."

# Update dotfiles submodules
cd $DIR
git submodule update --init --recursive

if [ ! -d "ycm_build" ]; then
    echo "Building YCM support libs..."
    mkdir ycm_build
    cd ycm_build
    cmake -G "Unix Makefiles" . ../vim/bundle/YouCompleteMe/cpp
    make ycm_support_libs
    cd ../
fi

echo "Changing the shell of $USER_NAME to zsh."
chsh -s /usr/bin/zsh $USER_NAME

echo "Symlinking configuration files..."

for f in *; do
    if [[ ! "bin README.md" =~ $f && ! -e "$(cat .gitignore | grep '^'$f'$')" && ! -L $USER_HOME/.$f ]]; then
        if [[ -e $USER_HOME/.$f ]]; then
            read -p "Overwrite $USER_HOME/.$f? (y/n): " -n 1
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                echo "Leaving $USER_HOME/.$f alone!"
                continue
            fi
        fi

        echo "Creating symlink from $DIR/$f to $USER_HOME/.$f"
        ln -fs $DIR"/"$f $USER_HOME"/."$f
        chown -h $USER_NAME:$USER_NAME $USER_HOME"/."$f
    fi
done
