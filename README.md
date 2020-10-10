# Dotfiles
This repository contains dotfiles for my Artix rice. Important scripts are located in `.local/bin/`
My [dwmblocks](https://github.com/paniash/dwmblocks) build uses scripts from the `.local/bin/statusbar` folder.

Check out `.config/nvim/init.vim` if you're interested in my vim config ;).

### System information
- Window manager: [suckless' dwm](https://github.com/paniash/dwm)
- Terminal emulator: [st](https://github.com/paniash/st)
- System monitor: [dwmblocks](https://github.com/paniash/dwmblocks)
- Application launcher: [dmenu](https://github.com/paniash/dmenu)
- Notifications: [dunst](https://dunst-project.org/)
- Editor: [neovim](https://neovim.io/)
- Shell: [zsh](https://wiki.archlinux.org/index.php/Zsh)
- Browser: firefox with [buku](https://github.com/jarun/buku)
- PDF Reader: [zathura](https://pwmt.org/projects/zathura/)
- File manager: [lf](https://github.com/gokcehan/lf)
- Mail: [neomutt](https://neomutt.org/) with [mutt-wizard](https://github.com/LukeSmithxyz/mutt-wizard)
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

## Issues
If you have any issues, please create an issue in this repo. I will try my best to resolve it.
