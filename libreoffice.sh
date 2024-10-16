#!/usr/bin/env bash

source "./_utils.sh"

print_color $YELLOW "\nInstalling libreoffice-still...\n"
sleep 2

install libreoffice-still ttf-ms-win11-auto

cp -R ./.config/libreoffice $HOME/.config/

clear
print_color $GREEN "Libreoffice-still installed\n"
sleep 2
