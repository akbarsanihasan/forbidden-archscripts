#!/usr/bin/env bash

source "./_utils.sh"

print_color $YELLOW "Install java...\n"
install jdk-openjdk

clear
print_color $GREEN "Java installed...\n"
sleep 2
