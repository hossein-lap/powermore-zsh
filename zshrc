#  _  _ ___    
# | || | __|   H
# | __ | _|    A
# |_||_|___|   P
#              
#
# plugins
sourceit() {
    if [ -r "${1}" ]; then
	source "${1}"
    fi
}

sourceit "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
sourceit "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
sourceit "/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"

#sourceit "${HOME}/.zshrc.d/plugs/zsh-history-substring-search/zsh-history-substring-search.zsh"
#sourceit "${HOME}/.zshrc.d/plugs/zsh-autosuggestions/zsh-autosuggestions.zsh"
#sourceit "${HOME}/.zshrc.d/plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
#
# disable duplicated command in zsh_history {{{
setopt histignorealldups
# }}}
#source /usr/share/powerline/bindings/zsh/powerline.zsh

# history file {{{
export HISTFILE=~/.zshrc.d/histfile
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
sourceit "${HOME}/.zshrc.d/powermore.zsh" # Script with prompt, disable hardcoded colors.
sourceit "${HOME}/.zshrc.d/utilities.zsh" false  # Optional scripts (see above), enable dirstack tweaks.

# source aliases file {{{
sourceit "${HOME}/.zshrc.d/aliases.zsh"
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
#date
#[ $[ $RANDOM % 4 ] == 0 ] && neofetch || pfetch
#fm6000 -n -r -c random
#fm4000 -n -r -c white
## }}}
#
alias s='source ~/.zshrc'

# keybinds {{{
# normal HOME and END behavior
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line
# }}}
