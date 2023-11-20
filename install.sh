#!/bin/bash
# Setup dotfiles by creating symlinks to home folder

set -e
set -o pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
readonly DIR

readonly DOTFILES=(
    shell/bashrc
    shell/zshrc
    shell/aliases
    shell/env
    git/gitconfig
    git/gitignore_global
    tmux/tmux.conf
    task/taskrc
    zsh
    vim
    task
)

readonly CONFIG_DIRS=(
    kitty
    i3
    polybar
    picom
    rofi
)

install_dotfile()
{
    local dotfile
    dotfile=.$(basename "$1")

    if [ -e ~/"$dotfile" ]; then
        echo "$dotfile already exists in home directory. Creating a backup to $dotfile.bk"
        mv ~/"$dotfile" ~/"$dotfile.bk"
    fi

    ln -s "$DIR/$1" ~/"$dotfile"
}

install_configuration()
{
    local config
    config=$(basename "$1")

    if [ -e ~/.config/"$config" ]; then
        echo "$config already exists in .config directory. Creating a backup to $config.bk"
        mv ~/.config/"$config" ~/.config/"$config.bk"
    fi

    ln -s "$DIR/config/$1" ~/.config/"$config"
}

install_vim_plugins()
{
    vim +PlugInstall +qa
}

install_bin_files()
{
    mkdir -p ~/bin
    for file in bin/*; do
        ln -s "$file" ~/bin/
    done
}

install_default_packages()
{
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get install zsh powerline tmux fzf vim kitty picom rofi
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install zsh tmux-powerline tmux fzf vim kitty picom rofi
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S zsh powerline tmux fzf vim kitty picom rofi
    else
        echo "Could not determine package manager. Packages not installed" >&2
    fi
}

install_fonts()
{
    mkdir -p ~/.fonts
    cp fonts/* ~/.fonts
    fc-cache -fv
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

    for configuration in "${CONFIG_DIRS[@]}"; do
        install_configuration "$configuration"
    done

    install_bin_files
    install_vim_plugins
    install_fonts
}

main
