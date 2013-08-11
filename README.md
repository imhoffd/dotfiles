## Installation

Install zsh, set as default shell.

    chsh -s /bin/zsh

Then, simply clone the repository and run the deploy script.

    git clone --recursive git://github.com/dwieeb/dotfiles.git ~/dotfiles && cd ~/dotfiles
    ruby bin/deploy.rb

To check for updates, pull recursively.

    git pull --recurse-submodules
