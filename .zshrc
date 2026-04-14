# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# startx and xbindkeys after logging in
if [ -z "$DISPLAY" ] && [[ $(tty) = /dev/tty1 ]]; then
  xbindkeys &
  exec startx 
fi

# Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
#HISTSIZE=1000
#SAVEHIST=1000
setopt autocd notify
bindkey -v
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ringanaaro/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /home/ringanaaro/powerlevel10k/powerlevel10k.zsh-theme

# Plugins
# -- -- -- -- -- -- -- -- -- --
# ZSH Autosuggestions plugin
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
fi

# ZSH Syntax Highlighting plugin
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ZSH sudo plugin
if [ -f /usr/share/zsh-sudo/sudo.plugin.zsh ]; then
    source /usr/share/zsh-sudo/sudo.plugin.zsh
fi

# ZSH allclear plugin (when running cd, all terminal will clear)
if [ -f /usr/share/zsh/plugins/zsh-allclear/zsh-allclear.plugin.zsh ]; then
    source /usr/share/zsh/plugins/zsh-allclear/zsh-allclear.plugin.zsh
fi

# Custom Aliases
# -- -- -- -- -- -- -- -- -- -- 
# bat
alias cat='bat'
alias catn='bat --style=plain'
alias catnp='bat --style=plain --paging=never'

# lsd
alias ls='lsd --group-dirs=first'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'

# git
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

alias gdb='gdb -q'
alias graphics='amdgpu_top --gui & disown'

alias l='clear' # clears the terminal
alias rm='rm -vI' # "safer" remove
alias shimg='kitty +kitten icat' # show an image
alias shtdnw='shutdown now'
alias wifis='nmcli device wifi list' # shows all aviable wifi connections
# alias brillo='brightnessctl --device=amdgpu_bl1 s 30840' # set the brightness to 50%
alias mount_andr='jmtpfs' # uses the jmtpfs package to mount an android device connected through USB, to unmount use the usual comand umount
alias tengwriptor='python3 ~/Programacion/Tengwriptor/text_transcriber.py -c'

# make directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# open file with zathura and directly make it independent
zathura2() {
  zathura "$1" & disown
}

# as before but now closing terminal
zathura3() {
  zathura "$1" & disown && bspc node -k
}

# open and edit markdown file
typora2() {
  typora "$1" & disown
}

# as before but now closing terminal
typora3() {
  typora "$1" & disown && bspc node -k
}
# open image with pinta and directly make it independent
#pinta2() {
#  pinta "$1" & disown
#}

# as before but now closing terminal
#pinta3() {
#  pinta "$1" & disown && bspc node -k
#}

# Bindkeys
# -- -- -- -- -- -- -- -- -- --
# we can list all predefined commands with "zle -al"
bindkey '^[' autosuggest-accept # use alt+tab to accept a suggestion of the plugin
bindkey '^[[3~' delete-char # make the delete-key work
bindkey '^[[H' beginning-of-line # go to the beginning of line
bindkey '^[[F' end-of-line # go to the enf of line
bindkey '[1;5C' end-of-line # go to the end of line with ctrl + right
bindkey '[1;5D' beginning-of-line # go to the beginning of line with ctrl + right
bindkey '^U' kill-whole-line # delete a complete line
bindkey '^O' backward-kill-word # delete word backwards
bindkey '^L' .clear-screen

# define custom function
zle -N forward-kill-word
function forward-kill-word(){
  zle forward-word
  zle backward-kill-word
}
bindkey '^P' forward-kill-word # delete word fowards


# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# setopt HIST_IGNORE_ALL_DUPS sharehistory # to clean history with echo '' > ~/.zsh_history
# alias clearhist='echo '' > ~/.zsh_history' IT JUST DOES NOT WORK

# Path
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/ringanaaro/.local/bin:/usr/local/texlive/2025/bin/x86_64-linux

# Custom functions
# Set victim target
function settarget(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > /home/ringanaaro/.config/polybar/scripts/target
}

# Clear victim target
function cleartarget(){
    echo '' > /home/ringanaaro/.config/polybar/scripts/target
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/ringanaaro/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
