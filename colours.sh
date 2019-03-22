#!/usr/bin/env bash

dim=$(tput dim)
bold=$(tput bold)

red=$'\e[31m'
green=$'\e[32m'
cyan=$'\e[36m'
yellow=$'\e[33m'
reset=$'\e[0m'

Bred='\e[48;5;52m'
Bgreen='\e[48;5;22m'
Breset='\e[1;49m'

echo -e "${dim}Dim line of text${reset}"
echo -e "Normal line of text"
echo -e "${bold}Bold line of text${reset}"

echo -e "${dim}${cyan}Dim info message${reset}"
echo -e "${cyan}Normal info message"
echo -e "${bold}Bold info message${reset}"

echo -e "${dim}${yellow}Dim warning message${reset}"
echo -e "${yellow}Normal warning message"
echo -e "${bold}Bold info message${reset}"

echo -e "${dim}${red}Dim error message${reset}"
echo -e "${red}Normal error message"
echo -e "${bold}Bold error message${reset}"
