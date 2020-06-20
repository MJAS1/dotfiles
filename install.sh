#!/bin/bash
# Setup dotfiles by creating symlinks to home folder

set -e
set -o pipefail

readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

readonly DOTFILES=(
    bash/bashrc
    git/gitconfig
    git/gitignore_global
    shell/aliases
    tmux/tmux.conf
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

main()
{
    for dotfile in "${DOTFILES[@]}"; do
        install_dotfile "$dotfile"
    done

    install_vim_plugins
}

main
