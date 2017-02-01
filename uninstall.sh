#!/usr/bin/env bash

set -e


uninstall_dotfiles_fever(){
    # dot_files=$(dirname $0)
    unlink_files=(
        "${HOME}/.profile"
        "${HOME}/.bashrc"
        "${HOME}/.inputrc"
        "${HOME}/.screenrc"
        "${HOME}/.ackrc"
        "${HOME}/.gemrc"
        "${HOME}/.irbrc"
        "${HOME}/.pryrc"
        "${HOME}/.nanorc"
    )
    
    for file in ${unlink_files[@]}; do
        if [[ -h "${file}" ]]; then
            unlink "${file}" && printf "${file} unlinked...\n"
        fi
    done
    echo "Uninstallation completed..."
}

echo "This will remove Dotfiles linkings... Are you sure ? (Y/n)"
read ARE_YOU_SURE
if [[ $ARE_YOU_SURE == 'n' || $ARE_YOU_SURE == 'N' ]]; then
    exit
fi

uninstall_dotfiles_fever