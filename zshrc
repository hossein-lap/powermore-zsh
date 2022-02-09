#  _  _ ___    
# | || | __|   H
# | __ | _|    A
# |_||_|___|   P
#              
#
# plugins {{{
# syntax highlighting
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# }}}
# disable duplicated command in zsh_history {{{
setopt histignorealldups
# }}}
#source /usr/share/powerline/bindings/zsh/powerline.zsh

# NOTE THAT these two scripts must be called with parameters.
source ~/.zsh.d/powermore.zsh # Script with prompt, disable hardcoded colors.
source ~/.zsh.d/utilities.zsh false  # Optional scripts (see above), enable dirstack tweaks.
# source aliases file {{{
source ~/.zsh.d/aliases.zsh
# }}}

## zsh prompt {{{
#PROMPT=" %(?.♠.%F{red}♥%f) %(?.♣.%F{red}♦%f) %F{magenta}%.%f "
#RPROMPT="%F{green}${vcs_info_msg_0_}%f"
#
#PROMPT=" %(?.♠.%F{red}♥) %F{magenta}%.%f %F{blue}%B→%b "
#RPROMPT="%F{green}${vcs_info_msg_0_}%f%F{red}%(?..%F{red} %?)%f"
#
#PROMPT=" %(?.♠.%F{red}♥) %F{magenta}%. %(?..%F{red}%? )%F{blue}⇒ "
#PROMPT=" %(?.♠.%F{red}♥) %F{magenta}%. %F{blue}%B⇒%b "
#RPROMPT="$(echo -n ${vcs_info_msg_0_}%f)"
#RPROMPT=" %1~ %F{red}${vcs_info_msg_0_}%f %# "
#RPROMPT='%(?..%F{red}%?)'
#RPROMPT='%{%F{$1}%K{$2}%} $last_code $rc'
## }}}
# auto correction {{{
setopt CORRECT
setopt CORRECT_ALL
# }}}
# auto completion {{{
autoload -Uz compinit && compinit
# }}}

# autostart commands {{{
date
#[ $[ $RANDOM % 4 ] == 0 ] && neofetch || pfetch
#fm6000 -n -r -c random
#fm4000 -n -r -c white
## }}}
