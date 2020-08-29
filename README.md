# Dotfiles
This repository contains dotfiles for my Arch linux system. Important scripts are located in `.local/bin/`
My [dwmblocks](https://github.com/paniash/dwmblocks) build uses scripts from the `.local/bin/statusbar` folder.

## Using the setup
To get the same setup as I have, obviously you'll have to install the required packages for which the dotfiles exist. On a freshly installed system, make sure to install `git` and `stow` (GNU Stow).

### Installation
Clone the repository into your home directory,
```
git clone https://github.com/paniash/dotfiles
```

On Arch-based distros,
```shell
sudo pacman -S git stow
cd dotfiles
stow *
```

Log out and log back in. You should have the same setup.

## Issues
If you have any issues, please create an issue in this repo. I will try my best to resolve it.
