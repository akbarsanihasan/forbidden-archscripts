#!/usr/bin/env bash

source "./_utils.sh"

print_color $YELLOW "Installing persepolis\n"
sleep 2

install persepolis

cp -R ./.config/persepolis_download_manager $HOME/.config/

sed -i "s|download_path=.*|download_path=$HOME/Downloads|" $HOME/.config/persepolis_download_manager/persepolis.conf

clear
print_color $GREEN "Persepolisdm installed\n"
