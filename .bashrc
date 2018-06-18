# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors the prompt
export PS1='\[\033[3;35m\]\u@\h \[\033[00;34m\]\W \$ \[\033[00m\]'

# Keyboard layout
#sudo loadkeys solemak > /dev/null
#sudo loadkeys se > /dev/null

export EDITOR=vim
export ECLIPSE_HOME=/usr/share/eclipse
export XCOMPOSE="$HOME/.XCompose"

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Stderred
export LD_PRELOAD="/home/sebelino/bin/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"

# Gem
export PATH=$PATH:/home/sebelino/.gem/ruby/2.0.0/bin
export PATH=$PATH:/home/sebelino/bin


# added by travis gem
[ -f /home/sebelino/.travis/travis.sh ] && source /home/sebelino/.travis/travis.sh
