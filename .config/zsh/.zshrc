# Enable colors and change prompt:
autoload -U colors && colors
## Luke's prompt
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
## Custom prompt
# PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M:%{$fg[magenta]%}%~%{$fg[red]%}%(!.#. >)%b "
## Custom prompt without inbuilt `pwd`
PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$fg[red]%}:%{$fg[magenta]%}%(!.#.$)%b "
setopt autocd	# automatically cd into typed directory
stty stop undef	# disable ctrl-s to freeze terminal

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
	    tmp="$(mktemp)"
	        lf -last-dir-path="$tmp" "$@"
	    if [ -f "$tmp" ]; then
	            dir="$(cat "$tmp")"
	            rm -f "$tmp"
	            [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	        fi
	}
bindkey -s '^o' 'lfcd\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# ## Add colors to man pages
 # man() {
 #     LESS_TERMCAP_md=$'\e[01;31m' \
 #     LESS_TERMCAP_me=$'\e[0m' \
 #     LESS_TERMCAP_se=$'\e[0m' \
 #     LESS_TERMCAP_so=$'\e[01;44;33m' \
 #     LESS_TERMCAP_ue=$'\e[0m' \
 #     LESS_TERMCAP_us=$'\e[01;32m' \
 #     command man "$@"
 # }

ex ()
{
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar xvjf $1 ;;
            *.tar.gz) tar xvzf $1 ;;
            *.bz2)  bunzip2 $1 ;;
            *.rar) unrar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xvf $1 ;;
            *.tbz2) tar xvjf $1 ;;
            *.tgz) tar xvzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *.deb) ar x $1 ;;
            *.tar.xz) tar xvf $1 ;;
            *.tar.zst) unzstd $1 ;;
            *) echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Disable globing on zsh (useful when downloading using youtube-dl)
setopt NO_NOMATCH

# Git bare repository
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# minimal nvim
alias vi='nvim --cmd "let vim_minimal=1" '

setopt nohup  # don't kill things on logging out
# setopt print_exit_value     # spits out some error if things go wrong

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
