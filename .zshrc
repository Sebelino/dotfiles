# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="miloshadzic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-autosuggestions colored-man-pages autojump zsh-syntax-highlighting)

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

source $ZSH/oh-my-zsh.sh

# User configuration

# Preventing background child processes from dying on exit.
setopt NO_HUP
setopt NO_CHECK_JOBS
# No shared history between terminals.
setopt NO_SHARE_HISTORY

# Aliases
alias bakljus="sudo /bin/bash /usr/bin/asus-screen-brightness"
alias dup="urxvt &"
alias sok="sudo find / -name "
alias isok="sudo find / -iname "
alias netauto="sudo systemctl stop netctl-auto@wlp2s0"
alias psgrep="ps -A | grep"
alias listip="nmap -sP '192.168.1.*'"
alias blight="sudo asus-kbd-backlight"
alias sokip="sudo arp-scan --interface=wlp2s0 --localnet"

alias hemma="sudo netctl switch-to wlp2s0-Olssons"
alias emma="sudo netctl switch-to wlp2s0-Emperoy"
alias råma="sudo netctl switch-to wlp2s0-Sebelino"
alias kth="sudo netctl switch-to wlp2s0-eduroam"

alias v="vim"
alias q="exit"
#alias "skärmar"="xrandr --output eDP1 --pos 0x1080 --output HDMI1 --auto"
alias skärm="xrandr --output eDP1 --mode 1920x1080 --output HDMI1 --off"

function storfont_fn {
    size="$1"
    if [ -z "$size" ]; then
        size="14"
    fi
    urxvt -fn xft:inconsolata:size=$size,xft:monospace:size=$size &
}
alias storfont=storfont_fn
#alias storfont="urxvt -fn xft:inconsolata:size=16,xft:monospace:size=16"
# Get rid of "warning: failed to load bookmarks"
alias zat="zathura $1 2> /dev/null"
alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias ledoff="sudo sh -c 'setleds -D +caps < /dev/console' && sudo sh -c 'setleds -D -caps < /dev/console'"
alias mykeepass="keepassx ~/extra/gdrive/work-toolkit/Sebe.kdb"
alias vless="vim -u /usr/share/vim/vim80/macros/less.vim"
alias termkonf="vim ~/.Xresources && xrdb ~/.Xresources"
alias fluidsynt='fluidsynth -a pulseaudio -l -i /usr/share/gzdoom/soundfonts/gzdoom.sf2'

function cutvid_fn {
    if [ -z "$4" ]; then
        echo "Usage example: cutvid in.mp4 out.mp4 00:03:00 00:00:05"
    else
        set -x
        ffmpeg -i "$1" -ss "$3" -t "$4" -async 1 -strict -2 "$2" -y
    fi
}
alias cutvid=cutvid_fn

#alias "desmume"="desmume --cpu-mode=1 --jit-size=15 --3d-engine=2"
alias vim="nvim"

function upprepa_fn {
    while true; do
        $@
    done
}
alias upprepa=upprepa_fn

# Un-sudo
alias poweroff="sudo poweroff"
alias wifi-menu="sudo wifi-menu"
alias systemctl="sudo systemctl"
#alias pacman="sudo pacman"

export EDITOR=vim
export ECLIPSE_HOME=/usr/share/eclipse
export XCOMPOSE="$HOME/.XCompose"
export GREP_COLORS="fn=35:mc=01;30:ms=44:sl=21:cx=31"
#export PYTHONPATH="$PYTHONPATH:$(find $HOME/lib/python3/ -maxdepth 1 | tr '\n' ':')"
export GOPATH=$HOME/code/go
export PATH="$HOME/bin:$HOME/scripts:/usr/local/bin:/usr/share/webapps/bin:$GOPATH/bin:$PATH"

# Stderred
#export LD_PRELOAD="/home/sebelino/bin/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"

# C/C++
CXXFLAGS="--std=gnu++14 $CXXFLAGS"

# Less Colors for Man Pages
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# added by travis gem
[ -f /home/sebelino/.travis/travis.sh ] && source /home/sebelino/.travis/travis.sh
