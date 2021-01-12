dotfiles
========

.files used by myself

Usage
========

It's better to clone with recursive option to not to forget about git submodules:

```bash
    git clone --recursive https://github.com/webdizz/dotfiles .dotfiles
    cd .dotfiles && ./script/setup
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" # for Ubuntu
    git clone https://github.com/webdizz/homebrew-brewfile ~/.homebrew-brewfile # for Ubuntu https://github.com/webdizz/linuxbrew-brewfile ~/.linuxbrew-brewfile
    cd ~/[.linuxbrew-brewfile|.homebrew-brewfile] && brew bundle
```
