#!/usr/bin/env bash

set -e


install_dotfiles_fever(){
    dot_files=$(dirname $0)

    if [[ -f "${HOME}/.profile" ]]; then
        mv $HOME/.profile $HOME/.profile_old && echo "~/.profile found and moved as: ~/.profile_old"
    fi
    if [[ -f "${HOME}/.bashrc" ]]; then
        mv $HOME/.bashrc $HOME/.bashrc_old && echo "~/.bashrc found and moved as: ~/.bashrc_old"
    fi

    ln -s "${dot_files}/rc/profile" "${HOME}/.profile" && echo "~/.profile"
    ln -s "${dot_files}/rc/bashrc" "${HOME}/.bashrc" && echo "~/.bashrc"
    ln -s "${dot_files}/rc/inputrc" "${HOME}/.inputrc" && echo "~/.inputrc"
    ln -s "${dot_files}/rc/screenrc" "${HOME}/.screenrc" && echo "~/.screenrc"

    if [[ $(command -v ag) ]]; then
        ln -s "${dot_files}/rc/ackrc" "${HOME}/.ackrc" && echo "~/.ackrc"
    fi
    if [[ $(command -v gem) ]]; then
        ln -s "${dot_files}/rc/gemrc" "${HOME}/.gemrc" && echo "~/.gemrc"
    fi
    if [[ $(command -v irb) ]]; then
        ln -s "${dot_files}/rc/irbrc" "${HOME}/.irbrc" && echo "~/.irbrc"
    fi
    if [[ $(command -v pry) ]]; then
        ln -s "${dot_files}/rc/pryrc" "${HOME}/.pryrc" && echo "~/.pryrc"
    fi
    
    if [[ $(command -v nano) ]]; then
        if [[ $(uname) == "Darwin" ]]; then
            nano_version=$(brew ls --versions | grep nano | cut -d' ' -f2)
            cp "${dot_files}/rc/nanorc" "${HOME}/.nanorc"
            echo "include \"/usr/local/Cellar/nano/${nano_version}/share/nano/*.nanorc\"" >> "${HOME}/.nanorc" &&
            echo "~/.nanorc"
        fi
    fi
    
    echo "Installation completed..."
}

install_dotfiles_fever