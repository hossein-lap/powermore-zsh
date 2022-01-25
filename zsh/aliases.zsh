#              
#  _  _ ___    
# | || | __|   H
# | __ | _|    A
# |_||_|___|   P
#              
#

alias aria2c='aria2c -x16 -c'
alias ddg='cd ~/Downloads/linksdl/ && links https://duckduckgo.com'

alias tmh='tmux new -s hos'

alias pwgen='pwgen -s'
alias psgen='pwgen'
alias psgn='pwgen'
alias pwgn='pwgen'

alias t='tmux'
alias sc='screen -S $(date +%d%H%M)'
alias tls='tmux ls'

alias grep='grep --color=auto'

alias tree='tree --dirsfirst -FC'
alias lree='tree -Dh -p'

alias lt='lree -L 1'

alias l='ls -FX -lh -A -C'
alias ls='ls -X --color=auto --group-directories-first'
alias ll='ls -lh'
#alias ll='ls -FX -Gg -h'
alias la='ll -A'

alias poweroff='shutdown -h now'

alias qemu-system-x86_64='qemu-system-x86_64 -m 640'
alias screenfetch='screenfetch -w'

alias fetchmaster='fm6000 -r -c random'

alias clear="clear && printf '\e[3J'"

#alias c='clear; source ~/.zshrc'
alias cls='clear;tree -L 1 -p -ugsh -D -cr '
alias cl='clear;ls'
alias c='clear; date'

alias virtualdebian='qemu-system-x86_64 -hda /home/nerd/Templates/qemu/debian/debian-10.3-amd64-standard.img'
alias virtualarch='qemu-system-x86_64 -hda /home/nerd/Templates/qemu/arch/archlinux.img'

alias xcode='nvim -u ~/.config/nvim/xcoderc.vim'
alias code='nvim -u ~/.config/nvim/coderc.vim'

#alias killall='killall -u $USER'

alias learncpp='links https://learncpp.com'
#alias greeting='clear; figlet Happy New Year | nms; echo'

alias x='startx' 
alias startx='startx'

#alias pkg-install='sudo apt install'
#alias pkg-update='sudo apt update'
#alias pkg-upgrade='sudo apt upgrade'
#alias pkg-search='apt search'

#alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias less='bat -n --style=plain --paging=always'
alias cat='bat -P --style=plain'
alias bat='bat'

alias todolist='nvim ~/Templates/TODO.list'

alias neofetch='neofetch --ascii_distro artix_small'
alias ssrcp='date '\''+%H %M %S'\'' | figlet -f small | lolcat'

## directories
alias vc='cd ~/.vim; c; tree -d -L 1'
alias d='cd ~/downloads; c; tree -d -L 1'
alias D='cd ~/documents; c; tree -d -L 1'
alias p='cd ~/pictures; c; tree -d -L 1'
alias p='cd ~/videos; c; tree -d -L 1'
alias T='cd ~/templates; c; tree -d -L 1'
alias W='cd ~/w/; c; tree -d -L 1'

alias m='cmus'

#alias xcode='nvim -u ~/.config/nvim/xcoderc.vim '
#alias code='nvim -u ~/.config/nvim/coderc.vim '
#alias vscodium='nvim -u ~/.config/nvim/vscodiumrc.vim'

alias ed="ed -p ':'"

alias q="exit"

alias z="zsh"

alias ..="cd .."
alias ...="cd ../.."

alias gln='git clone'
alias gss="git status -s"
alias gic="git init && git add . && git commit -m 'Create repo'"
alias glog="git log --stat"

alias msm="make && sudo make install"

alias xrate.sh="bash $HOME/bin/xrate.sh"
alias nvi='nvim -u ~/.vi/virc.vim'
