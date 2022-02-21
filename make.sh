#!/bin/bash
set -e

ver_number="0.2"

function applyit () {
# check any config file exists
if [[ -f "$HOME/.zshrc" ]]; then 
  # check any backup file exists
  if [[ -f "$HOME/.zshrc.bak" ]]; then
    echo "remove old backup.."
    rm -f $HOME/.zshrc.bak
  fi
  # backup the current .zshrc file if exists
  echo "backup ${HOME}/zshrc file.."
  mv -f $HOME/.zshrc $HOME/.zshrc.bak
  echo ""
fi

# check any zsh.d directory exists
if [[ -d "$HOME/.zsh.d" ]]; then
  # check any backup zsh.d directory exists
  if [[ -d "$HOME/.zsh.d.bak" ]]; then
    echo "remove old backup.."
    rm -rf $HOME/.zsh.d.bak
  fi
  # backup the current .zsh.d directory if exists
  echo "backup ${HOME}/zsh.d directory.."
  cp -rf $HOME/.zsh.d $HOME/.zsh.d.bak
  rm -rf $HOME/.zsh.d
  echo ""
fi

# copy the new config file to home folder
echo "copy new config files.."
cp -f zshrc $HOME/.zshrc
# copy the new config file to home folder
mkdir $HOME/.zsh.d
cp -f zsh/* $HOME/.zsh.d/
echo "config files added"
# print exit status
echo "[ Shell returned $? ]"

exit 0
}

function help () {
cat << _EOF
powermore-zsh plugin, a fork of powerless plugin.
I just added some more git functionalities to it.
for more details checkout the base project.
Version ${ver_number}

Usage: [ ./make.sh ] or [ bash make.sh ]

Arguments:
	-h print this message
	-v print version and exit
	-r removes the backup files
	   for having a cleaner home folder ;)

Wanna fork it?
		https://github.com/primejade/powermore-zsh

The powerless project:
		https://github.com/martinrotter/powerless
_EOF

exit 0
}

function backup_remove () {
  if [[ -d "$HOME/.zsh.d.bak" ]]; then
    echo "remove backups.."
    rm -rf $HOME/.zsh.d.bak
    rm -rf $HOME/.zsh.d.bak
  else
    echo "You are clean, no backup file exists :)"
  fi

exit 0
}

case $1 in
  "") applyit
    ;;
  -h) help
    ;;
  -r) backup_remove
    ;;
  -v) echo "powermore ZSH plugin version ${ver_number}"
    ;;
   *) help
    ;;
esac
