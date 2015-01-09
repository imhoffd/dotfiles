#!/bin/bash

GRAY="\033[37m"
GREEN="\033[32m"
RED="\033[31m"
END_COLOR="\033[0m"

if [[ $1 ]]; then
    user=$1
else
    user=$USER
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

echo "Please ensure the following are installed:"
echo -e $GRAY" - zsh"$END_COLOR
echo -e $GRAY" - vim"$END_COLOR

echo "Updating dotfiles and dependencies..."

# Update dotfiles submodules
cd $DIR
git submodule update --init --recursive

echo -e $GREEN"   done!"$END_COLOR

echo "Making vimproc..."

cd $DIR/vim/bundle/vimproc.vim
# attempt make

echo -e $GREEN"   done!"$END_COLOR

cd $DIR

if [[ $ZSH_NAME ]]; then
    echo "Changing the shell of $USER to zsh."
    chsh -s /usr/bin/zsh
    echo -e $GREEN"   done!"$END_COLOR
fi

echo "Symlinking configuration files..."

for f in *; do
    if [[ ! "bin override README.md" =~ $f &&
          ! -e "$(cat .gitignore | grep '^'$f'$')" &&
          ! -L $USER_HOME/.$f ]]; then
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

echo -e $GREEN"   done!"$END_COLOR

if [[ ! -L $USER_HOME"/.oh-my-zsh/custom/themes" ]]; then
    echo "Symlinking overrides..."
    attempt "rmdir $USER_HOME/.oh-my-zsh/custom/themes"
    ln -snv $DIR"/override/oh-my-zsh/custom/themes" $USER_HOME"/.oh-my-zsh/custom"
    echo -e $GREEN"   done!"$END_COLOR
fi
