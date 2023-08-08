#
#  _  _ ___
# | || | __|   H
# | __ | _|    A
# |_||_|___|   P
#
#
#alias sudo="doas"

alias lf="lfub"

alias exa="exa --sort extension --group-directories-first"
alias tree='exa -T --icons'
alias ts='exa -T --icons -L 1'

alias tb="nc termbin.com 9999"
alias l="exa"
alias ll="l -l --icons"
alias la="l -a --icons"

alias cls="clear; ll"
alias cl="clear; ls"

alias ls='ls -X --color=auto --group-directories-first'

#alias tree='tree --dirsfirst -FC'
#alias lree='tree -Dh -p'
#alias lt='lree -L 1'

#alias l='ls -FX -lh -A -C'
#alias ll='clear; /usr/bin/ls -lh -X -gG'
##alias ll='ls -FX -Gg -h'
#alias la='ls -1 -sh'

#alias cls='clear;tree -L 1 -p -ugsh -D -cr '
#alias cls="clear;ls -lhtrGX"
#alias cls="clear; exa -ld "
#alias cl='clear;ls'
#alias cl="clear; exa --sort extension"
#alias cll="clear; exa --sort extension -l"

alias c='clear'

alias links="links -download-dir $HOME/Downloads/linksdl"

alias aria2c='aria2c -x16 -c'
alias ddg='links https://duckduckgo.com'

alias tmh='tmux new -s hos'

alias pwgen='pwgen -s'
alias psgen='pwgen'
alias psgn='pwgen'
alias pwgn='pwgen'

alias t='tmux'
alias sc='screen'
#alias tls='tmux ls'

alias grep='grep --color=auto'

alias poweroff='shutdown -h now'

#alias qemu-system-x86_64='qemu-system-x86_64 -m 640'
alias screenfetch='screenfetch -w'

alias fetchmaster='fm6000 -r -c random'

alias clear="clear && printf '\e[3J'"

#alias nvi="vim -c 'set background=light'"
#alias virtualdebian='qemu-system-x86_64 -hda /home/nerd/Templates/qemu/debian/debian-10.3-amd64-standard.img'
#alias virtualarch='qemu-system-x86_64 -hda /home/nerd/Templates/qemu/arch/archlinux.img'

#alias xcode='nvim -u ~/.config/nvim/xcoderc.vim'
#alias code='nvim -u ~/.vim/coderc.vim'
alias code='nvim -u ~/.config/nvim/coderc.vim'

#alias killall='killall -u $USER'

alias learncpp='links https://learncpp.com'
#alias greeting='clear; figlet Happy New Year | nms; echo'

alias x='startx' 
#alias startx='startx'

#alias pkg-install='sudo apt install'
#alias pkg-update='sudo apt update'
#alias pkg-upgrade='sudo apt upgrade'
#alias pkg-search='apt search'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias lat='bat -n --style=plain --paging=always'
alias bat='bat -P --style=plain'

#alias todolist='nvim ~/Templates/TODO.list'

alias neofetch='neofetch --ascii_distro arch_small'
alias ssrcp='date '\''+%H %M %S'\'' | figlet -f small | lolcat'

## directories
#alias vc='cd ~/.vim; c; tree -d -L 1'
#alias d='cd ~/downloads; c; tree -d -L 1'
#alias D='cd ~/documents; c; tree -d -L 1'
#alias p='cd ~/pictures; c; tree -d -L 1'
#alias p='cd ~/videos; c; tree -d -L 1'
#alias T='cd ~/templates; c; tree -d -L 1'
#alias W='cd ~/w/; c; tree -d -L 1'

alias m='cmus'

#alias xcode='nvim -u ~/.config/nvim/xcoderc.vim '
#alias code='nvim -u ~/.config/nvim/coderc.vim '
#alias vscodium='nvim -u ~/.config/nvim/vscodiumrc.vim'

alias ed="ed -p ':'"

alias q="exit"

#alias z="zsh"

alias ..="cd .."
alias ...="cd ../.."

alias gln='git clone'
alias gss="git status -s"
alias gic="git init && git add . && git commit -m 'Create repo'"
alias glog="git log --stat --show-signature"
#alias glg="git log --stat --oneline --all --graph"
alias glg="git log --oneline --all --graph"

alias msm="make && sudo make install"

alias vi="vim -u ~/.vim/plain.vim"
alias sbp="PS1='[user@host ~]$ '"

alias plow="glow -p"

alias fm4000="fm4000 -de dwm -w -r -c random"

#alias pacman="pacman --needed"
#alias yay="yay --sudo doas"

alias gpg-agent-reload="gpg-connect-agent reloadagent /bye"

#alias etc-resolv-dns="echo 'nameserver 4.2.2.4' | sudo tee /etc/resolv.conf"

alias em="emacsclient -c -a 'emacs'"
alias lolcat='lolcat -S 7'

alias glg="git log --oneline --all --graph --stat"
alias gls="git log --oneline --all --graph"
alias gll="git log --stat --graph --all --show-signature"

