# Dotfiles
This repository contains dotfiles for my Artix rice. Important scripts are located in `.local/bin/`
My [dwmblocks](https://github.com/paniash/dwmblocks) build uses scripts from the `.local/bin/statusbar` folder.

### System information
- Window manager: [suckless' dwm](https://github.com/paniash/dwm)
- Terminal emulator: [st](https://github.com/paniash/st)
- System monitor: [dwmblocks](https://github.com/paniash/dwmblocks)
- Application launcher: [dmenu](https://github.com/paniash/dmenu)
- Notifications: [dunst](https://dunst-project.org/)
- Editor: [neovim](https://neovim.io/)
- Shell: [zsh](https://wiki.archlinux.org/index.php/Zsh)
- Browser: [firefox](https://www.mozilla.org/en-US/firefox/new/)
- PDF Reader: [zathura](https://pwmt.org/projects/zathura/)
- File manager: `cd` with `fzf`, `ls`, `pwd`
- Mail: [neomutt](https://neomutt.org/) with [isync](https://github.com/gburd/isync)
- RSS feed reader: [newsboat](https://newsboat.org/)
- Music player: [ncmpcpp](https://wiki.archlinux.org/index.php/Ncmpcpp) with [mpd](https://wiki.archlinux.org/index.php/Music_Player_Daemon)
- Video player: [mpv](https://mpv.io/)


## Using the setup
To get the same setup as I have, obviously you'll have to install the required packages for which the dotfiles exist. On a freshly installed system, make sure to install `git` and `stow` (GNU Stow).

### Installation
Clone the repository into your home directory,
```shell
git clone https://github.com/paniash/dotfiles
```

On Arch-based distros,
```shell
sudo pacman -S git stow
cd dotfiles
stow *
```

Log out and log back in. You should have the same setup.

**NOTE:** I personally don't use `stow` so I cannot guarantee that this will work. If something breaks, feel free to open an issue in the issue tracker.

## Issues & Contributions
If you have any issues, please create an issue in this repo. I will try my best to resolve it. Feel free to contribute to this repo. I am learning more about the UNIX system as well so any feedback will be appreciated. ;-)
