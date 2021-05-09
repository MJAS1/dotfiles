#!/bin/bash
# Setup dotfiles by creating symlinks to home folder

set -e
set -o pipefail

readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

readonly DOTFILES=(
    shell/bashrc
    shell/zshrc
    shell/aliases
    shell/env
    git/gitconfig
    git/gitignore_global
    tmux/tmux.conf
    ledger/ledgerrc
    i3
    zsh
    vim
)

install_dotfile()
{
    local dotfile
    dotfile=.$(basename "$1")

    if [ -e ~/"$dotfile" ]; then
        echo "$dotfile already exists in home folder. Creating a backup to $dotfile.bk"
        mv ~/"$dotfile" ~/"$dotfile.bk"
    fi

    ln -s "$DIR"/"$1" ~/"$dotfile"
}

install_vim_plugins()
{
    vim +PlugInstall +qa
}

install_default_packages()
{
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get install zsh powerline tmux
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install zsh tmux-powerline tmux
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S zsh powerline tmux
    else
        echo "Could not determine Linux distribution. Packages not installed" >&2
    fi
}

main()
{
    while true; do
        read -p "Install default packages (y/n)? " -r
        case $REPLY in
            y|Y ) install_default_packages; break;;
            n|N ) break;;
        esac
    done

    for dotfile in "${DOTFILES[@]}"; do
        install_dotfile "$dotfile"
    done

    install_vim_plugins
}

main
