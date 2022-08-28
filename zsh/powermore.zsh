################################################
### This is the ZSH powermore main script.
### a fork of ZSH powerless script.
###
### How to call: source powermore.zsh <ENABLE_CUSTOM_COLORS>
################################################
#
# Set options and settings.
setopt PROMPT_SUBST
setopt PROMPT_SP

# Specify colors.
color_text="234"
color_user_host="79"
color_code_wrong="196"
color_pwd="235"
color_text_pwd="111"
color_fold_icon="111"
color_git_fold='202'
color_git_pwd="237"
color_git_ok="112"
color_git_unstaged="39"
color_git_dirty="214"
color_git_notok="204"
color_git_adddirty="141"
color_venv="33"

# git status prompt {{{
## Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
## Enable substitution in the prompt.
setopt prompt_subst
## Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
## add ${vcs_info_msg_0} to the prompt
## e.g. here we add the Git information in red
##     ךּ            
icon_fold=' '
git_icon_fold=' '
git_icon_dirty=' '
git_icon_staged=' '
git_icon_clean=' '
git_icon_new=' '
git_icon_stash=' '

## Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
## Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ${git_icon_dirty}
zstyle ':vcs_info:*' stagedstr ${git_icon_staged}
## Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '%u%c'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# }}}

# Specify common variables.
#prompt_char='➡'
#prompt_char='►'
#prompt_char='⇢'
second_prompt_char=''
first_prompt_char=''
prompt_char=' €'
rc='%{%f%k%}'

get-user-host() {
  [[ -n "$SSH_CLIENT" ]] && echo -n "%{%F{$1}%K{$2}%} %n@%M $rc"
}

get-icon() {
      echo -n "%{%F{$1}%K{$2}%} ${icon_fold}$rc"
}

#get-git-icon() {
#
#    git diff --quiet --ignore-submodules --exit-code HEAD > /dev/null 2>&1
#    if [[ "$?" == "129" ]]; then
#      echo -n "%{%F{$1}%K{$2}%}  $rc"
#    elif [[ "$?" == "1" ]]; then
#      echo -n "%{%F{$1}%K{$2}%} TETET $rc"
#    fi
#}

get-git-info() {
  local git_branch=$(git symbolic-ref --short HEAD 2> /dev/null)
      first_prompt_char=''

  if [[ -n "$git_branch" ]]; then
        local git_stash_count="$(git stash list | grep -c ${git_branch} )"

        if [[ "$git_stash_count" -gt "0" ]]; then
          git_stash="${git_icon_stash}${git_stash_count} "
        else
          git_stash=""
        fi
    git_symbols="$vcs_info_msg_0_"

    if [[ "$(echo -n $vcs_info_msg_0_)" == "${git_icon_dirty}" ]]; then
      back_color=$5
    elif [[ "$(echo -n $vcs_info_msg_0_)" == "${git_icon_staged}" ]]; then
      back_color=$3
    elif [[ "$(echo -n $vcs_info_msg_0_)" == "${git_icon_dirty}${git_icon_staged}" ]] ; then
      back_color=$4
    elif [[ "$(git status -s | grep -c '^?')" -gt 0 ]]; then
      git_symbols="${git_icon_new}"
      back_color=$6
    elif [[ "$(git status -s | wc -l)" == "0" ]]; then
      git_symbols="${git_icon_clean}"
      back_color=$2
    else
      back_color="1"
    fi

    echo -n "%{%F{$color_git_fold}%K{$1}%} ${git_icon_fold}%{%F{224}%K{$1}%} $git_branch%{%F{$back_color}%K{$1}%} $git_symbols$git_stash%{%F{$1}%k"${second_prompt_char}"%}$rc"
  fi
}

get-pwd() {
  local git_branch=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [[ -n "$git_branch" ]]; then
  local fst_prompt_colr="%{%K{$2}%}"
  local first_prompt_char=''
  fi
  echo -n "%{%F{$1}%K{$2}%} %. %{%F{$2}%k%}${fst_prompt_colr}${first_prompt_char}$rc"
}

get-venv-info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo -n "%{%F{$1}%K{$2}%} $(basename $VIRTUAL_ENV) $rc"
    fi
}

get-last-code() {
  [[ (-n "$last_code") && ($last_code -ne 0) ]] \
	  && echo -n "%{%F{1}%K{0}%} $last_code $rc" \
	  && prompt_char=' ¢' # prompt_char='﬋'
# [[ (-n "$last_code") && ($last_code -ne 0) ]] && prompt_char='➥'

}

get-prompt() {
echo -n && ([[ "$(print -P "%#")" == "#" ]] && echo -n "%{%F{$color_code_wrong}%} $prompt_char$rc%{\e[0m%} " || echo -n "$prompt_char%{\e[0m%} " )
#echo -n && ([[ "$(print -P "%#")" == "#" ]] && echo -n "%{%F{$color_code_wrong}%k%} $prompt_char$rc%{\e[0m%} " || echo -n " $prompt_char%{\e[0m%} " )
}

powermore-prompt() {
  get-last-code $color_code_wrong $color_text
  get-user-host $color_text $color_user_host
  get-icon $color_fold_icon $color_pwd
  get-pwd $color_text_pwd $color_pwd
# get-git-icon $color_text_pwd $color_git_pwd
  get-git-info $color_git_pwd $color_git_ok $color_git_unstaged $color_git_adddirty $color_git_dirty $color_git_notok $color_git_last
  get-venv-info $color_text $color_venv
  echo ''
  get-prompt
}

powermore-right-prompt() {
}

precmd-powermore() {
  last_code=$?

  if [[ $is_first_prompt -eq 999 ]]; then
    # echo
  else
    is_first_prompt=999
  fi
}

# Attach the hook functions.
[[ ${precmd_functions[(r)precmd-powermore]} != "precmd-powermore" ]] && precmd_functions+=(precmd-powermore)

# Set the prompts.
PROMPT='$(powermore-prompt)'
RPROMPT='$(powermore-right-prompt)'
