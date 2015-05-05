### Installation

Simply clone the repository and run the deploy script.

    git clone --recursive https://github.com/dwieeb/dotfiles.git ~/.dotfiles
    ~/.dotfiles/bin/deploy.sh

#### Notes for Mac

* You need to tell brew to install vim --with-lua.

### Updating

Pull recursively, and then update submodules.

    git pull --recurse-submodules
    git submodule init
    git submodule update
