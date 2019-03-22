#!/usr/bin/env bash

dim=$(tput dim)
bold=$(tput bold)

black=$'\e[30m'
grey=$'\e[38;5;236m'
white=$'\e[37m'
red=$'\e[31m'
green=$'\e[32m'
cyan=$'\e[36m'
yellow=$'\e[33m'
magenta=$'\e[35m'
reset=$'\e[0m'

bgWhite='\e[48;5;7m'
bgRed='\e[48;5;52m'
bgGreen='\e[48;5;22m'
bgBGreen='\e[48;5;2m'
bgReset='\e[49m'

echo -e "${dim}Dim line of text       ${cyan}Dim info message       ${yellow}Dim warning message       ${red}Dim error message${reset}"
echo -e "Normal line of text    ${cyan}Normal info message    ${yellow}Normal warning message    ${red}Normal error message${reset}"
echo -e "${bold}Bold line of text      ${cyan}Bold info message      ${yellow}Bold warning message      ${red}Bold error message${reset}"
echo

sep=''
echo -en "${bgWhite}${black} 16:20:42 ${bgBGreen}${white}${sep}${grey} ~/dev/project ${bgWhite}${green}${sep}"
echo -e "${black}  master ${bgReset}${white}${sep}${reset}"
echo -e "${bold}${green}\$ ${reset}git --no-pager diff"

echo -e "${dim}${cyan}diff --git a/foo.sh b/foo.sh"
echo -e "index abcdef0..93f3a4d 100755"
echo -e "--- a/foo.sh"
echo -e "+++ b/foo.sh${reset}"
echo -e "${dim}${magenta}@@ -42,2 +42,3 @@${reset} * Some list item"
echo -e " * Some other list item"
echo -e "${bold}${red}-## A${bgRed}n old ${bgReset}${red}title${reset}"
echo -e "${bold}${green}+"
echo -e "+##${bgGreen}#${bgReset} A${bgGreen} newly changed sub${bgReset}title${reset}"
