### Installation

Install zsh.
Set as default shell.

    chsh -s /bin/zsh

Then, simply clone the repository and run the deploy script.

    git clone --recursive https://github.com/dwieeb/dotfiles.git ~/dotfiles
    ruby ~/dotfiles/bin/deploy.rb

If you don't have ruby, symlink desired files & directories to your home directory, prepending a dot before each file or directory's name. Example:

    cd
    ln -s dotfiles/oh-my-zsh .oh-my-zsh

### Updating

Pull recursively, and then update submodules.

    git pull --recurse-submodules
    git submodule init
    git submodule update
