# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="browser"
export READER="zathura"
export FILE="lf"
export BIB="~/.config/latex/references.bib"

# ~/ Clean-up:
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
# export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"
export ZDOTDIR="$HOME/.config/zsh"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_DESKTOP_DIR="$HOME"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_VIDEOS_DIR='$HOME/videos'
export TASKRC="$HOME/.config/task/taskrc"
export TASKDATA="$HOME/.config/task"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export VIT_DIR="$HOME/.config/vit"
export WEECHAT_HOME="$HOME/.config/weechat/"
export WEECHAT_EXTRA_LIBDIR="$HOME/.config/weechat/"
export NOTMUCH_CONFIG="$HOME/.config/notmuch/notmuch-config"
# export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"
# gpg2 --homedir "XDG_DATA_HOME/gnupg"

# Other program settings:
export DICS="/usr/share/stardict/dic/"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=' -R'
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export MOZ_USE_XINPUT2="1"		# Mozilla smmoth scrolling/touchpads

export ELINKS_CONFDIR="$HOME/.config/elinks/"
export TMUXP_CONFIG_DIR="$HOME/.config/tmuxp/"
export PYTHONPATH="$PYTHONPATH:$HOME/.xacc/"
