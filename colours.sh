#!/usr/bin/env bash

dim=$(tput dim)
bold=$(tput bold)

red=$'\e[31m'
green=$'\e[32m'
cyan=$'\e[36m'
yellow=$'\e[33m'
magenta=$'\e[35m'
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

echo
echo -e "${dim}${cyan}diff --git a/foo.sh b/foo.sh"
echo -e "index abcdef0..93f3a4d 100755"
echo -e "--- a/foo.sh"
echo -e "+++ b/foo.sh${reset}"
echo -e "${dim}${magenta}@@ -42,2 +42,3 @@${reset} * Some list item"
echo -e " * Some other list item"
echo -e "${bold}${red}-## A${Bred}n old ${Breset}${red}title${reset}"
echo -e "${bold}${green}+"
echo -e "+##${Bgreen}#${Breset} A${Bgreen} newly changed sub${Breset}title${reset}"
