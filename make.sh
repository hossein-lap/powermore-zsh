#!/bin/bash
set -e

ver_number="0.8"

# apply {{{
function applyit () {
	func_name="apply:"
	# check any config file exists
	if [[ -f "${HOME}/.zshrc" ]]; then 
		# check any backup file exists
		if [[ -f "${HOME}/.zshrc.bak" ]]; then
			install_rc_file=1
			echo "${func_name} .zshrc backup exists"
		else
			install_rc_file=0
			echo "backup ${HOME}/zshrc file.."
			mv -f ${HOME}/.zshrc ${HOME}/.zshrc.bak
			echo ""
		fi
	fi

	# check any zshrc.d directory exists
	if [[ -d "${HOME}/.zshrc.d" ]]; then
		# check any backup zshrc.d directory exists
		if [[ -d "${HOME}/.zshrc.d.bak" ]]; then
			install_rc_dir=1
			echo "${func_name} .zshrc.d backup exists"
		else
			install_rc_dir=0
			echo "backup ${HOME}/zshrc.d directory.."
			cp -rf ${HOME}/.zshrc.d ${HOME}/.zshrc.d.bak
			rm -rf ${HOME}/.zshrc.d
			echo ""
		fi
	# backup the current .zshrc.d directory if exists
	fi

	# backup the current .zshrc file if exists
	if [ "${install_rc_file}" -eq 0 ]; then
		# copy the new config file to home folder
		cp -f zshrc ${HOME}/.zshrc
		echo "zshrc: [done]"
	else
		echo 'zshrc: there is nothing to do'
	fi

	# backup the current .zshrc file if exists
	if [ "${install_rc_dir}" -eq 0 ]; then
		# copy the new config file to home folder
		mkdir ${HOME}/.zshrc.d
		cp -rf zsh/* ${HOME}/.zshrc.d/
		echo "zshrc.d: [done]"
	else
		echo 'zshrc.d: there is nothing to do'
	fi


	if [ "${install_rc_dir}" -ne 0 ] && [ "${install_rc_file}" -ne 0 ]; then
		echo ""
		printf '\t%s\n' \
		"try with -r flag to [1mremove[0m old backups" \
		"or with -f flag to [1mremove[0m old backups and install the scripts"
		#"try with -r flag to **remove** old backups" 
		echo ""
	fi

# print exit status
echo "[ Shell returned $? ]"

exit 0
}
# }}}

# help {{{
function help () {
cat << _EOF
powermore-zsh plugin, a fork of powerless plugin.
I just added some more git functionalities to it.
for more details checkout the base project.
Version ${ver_number}

Usage: [ ./make.sh ] or [ bash make.sh ]

Running this script without any arguments will backup
the current ~/.zshrc and ~/.zshrc.d (if there is any already)
and copy the new config files into your \${HOME} directory.

Arguments:
	-h print this message
	-v print version and exit
	-r removes the backup files
	-f removes the backup files and installes the scripts

Wanna fork it?
		https://github.com/hossein-lap/powermore-zsh

The powerless project:
		https://github.com/martinrotter/powerless
_EOF

exit 0
}
# }}}

# rm backup {{{
function backup_remove () {
  if [[ -d "${HOME}/.zshrc.d.bak" ]]; then
    echo "remove backups.."
    rm -rf ${HOME}/.zshrc.d.bak
    rm -rf ${HOME}/.zshrc.bak
  else
    echo "You are clean, no backup file exists :)"
  fi
}
# }}}

case $1 in
  "") applyit ;;
  -h) help ;;
  -r) backup_remove ;;
  -f) backup_remove; applyit ;;
  -v) echo "powermore ZSH plugin version ${ver_number}" ;;
   *) help ;;
esac
