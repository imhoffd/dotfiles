#!/bin/bash

DIR="$( dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" )"

USER_HOME=$(eval echo ~${USER})

echo "Please ensure the following packages are installed."
echo "zsh"
echo "vim"

echo "Updating dotfiles and dependencies..."

# Update dotfiles submodules
cd $DIR
git submodule update --init --recursive

echo "Changing the shell of $USER to zsh."
chsh -s /usr/bin/zsh

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
    fi
done
