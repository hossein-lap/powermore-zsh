#  _  _ ___    
# | || | __|   H
# | __ | _|    A
# |_||_|___|   P
#              
#
# plugins
source ~/.zsh.d/plugs/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh.d/plugs/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh.d/plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
# disable duplicated command in zsh_history {{{
setopt histignorealldups
# }}}
#source /usr/share/powerline/bindings/zsh/powerline.zsh

# history file {{{
export HISTFILE=~/.zsh.d/histfile
export HISTSIZE=4096   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
# }}}

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
#
alias s='source ~/.zshrc'
