#!/usr/bin/env bash

bold=$(tput bold)

red=$'\e[31m'
green=$'\e[32m'
cyan=$'\e[36m'
yellow=$'\e[33m'
reset=$'\e[0m'

Bred='\e[48;5;52m'
Bgreen='\e[48;5;22m'
Breset='\e[1;49m'

echo -e "This is a normal line of text"
echo -e "${bold}This is a bold line of text${reset}"
echo -e "${cyan}This is an info message"
echo -e "${bold}And this info message is bold${reset}"
echo -e "${yellow}This is a warning"
echo -e "${bold}And this info message is bold${reset}"
echo -e "${red}This is an error"
echo -e "${bold}And this error is bold${reset}"
