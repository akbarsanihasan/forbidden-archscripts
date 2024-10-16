#!/usr/bin/env bash

set -e

# Color code
BLACK=30
RED=31
GREEN=32
YELLOW=33
BLUE=34
MAGENTA=35
CYAN=36
WHITE=37

# Global var
CURRENT_DIRECTORY=$(pwd)
AURH="yay" # Change me to yay or other compatible aur helper

function pman() {
    local manager=$(which $AURH)

    if [[ -z "$manager" ]]; then
        echo "$AURH not installed"
        exit 0
    fi

    $manager "$@"
}

function install() {
    pman -Sy --removemake --noconfirm --needed --sudoloop --cleanafter "$@"
}

function print_color() {
    local color="$1"
    local text="$2"
    local reset="\e[0m" # Reset color

    printf "\e[%sm%b$reset" "$color" "$text"
}

function package_exist() {
    package_name=$1

    # Use pacman to check if the package is installed
    if pacman -Qi "$package_name" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

if ! package_exist "$AURH"; then
    rm -rf $HOME/$AURH

    git clone https://aur.archlinux.org/$AURH.git $HOME/$AURH

    cd $HOME/$AURH
    makepkg -si --noconfirm

    cd $CURRENT_DIRECTORY
    rm -rf $HOME/$AURH
fi
