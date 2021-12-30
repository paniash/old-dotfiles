# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%:%{$fg[magenta]%}%1~%{$fg[blue]%}:%{$fg[yellow]%}%(!.#. $)%b "
setopt autocd	# automatically cd into typed directory
stty stop undef	# disable ctrl-s to freeze terminal
setopt interactive_comments

# History in cache directory:
HISTFILE=~/.cache/zsh_history
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Disable auditory bells
setopt nobeep

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
vicd()
{
    local dst="$(command vifm --choose-dir - "$@")"
    if [ -z "$dst" ]; then
        echo "Directory picking cancelled/failed"
        return 1
    fi
    cd "$dst"
}

bindkey -s '^o' 'vicd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# `bat` as MANPAGER
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Custom function to extract files
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
            *.zip|*.ZIP) unzip $1 ;;
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

fa() {
    cd "$(fd -t d | fzf)"
}

doi2bib() {
    curl -s "https://api.crossref.org/works/$1/transform/application/x-bibtex";
}

# Disable globing on zsh (useful when downloading using youtube-dl)
setopt NO_NOMATCH

# Git bare repository
alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

setopt nohup  # don't kill things on logging out
# setopt print_exit_value     # spits out some error if things go wrong

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


##################################################
############# EXAMPLE PROMPTS ####################
## Luke's prompt
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
## Custom prompt
# PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M:%{$fg[magenta]%}%~%{$fg[red]%}%(!.#. $)%b "
## Custom prompt without inbuilt `pwd`
# PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$fg[red]%}:%{$fg[magenta]%}%(!.#.$)%b "
# PS1="%B%{$fg[yellow]%}%~%{$fg[red]%}:%{$fg[magenta]%}%(!.#.$)%b "
##################################################
