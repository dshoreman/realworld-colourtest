#!/usr/bin/env bash

main() {
    colours
    messages
    zsh_prompt blue
    zsh_prompt green "git --no-pager diff"
    git_diff
}

dim=$(tput dim)
bold=$(tput bold)

black=$'\e[30m'
grey=$'\e[38;5;236m'
white=$'\e[37m'
red=$'\e[31m'
green=$'\e[32m'
blue=$'\e[34m'
cyan=$'\e[36m'
yellow=$'\e[33m'
magenta=$'\e[35m'
reset=$'\e[0m'

bgWhite='\e[48;5;7m'
bgRed='\e[48;5;52m'
bgGreen='\e[48;5;22m'
bgBGreen='\e[48;5;2m'
bgBlue='\e[48;5;4m'
bgReset='\e[49m'

colours() {
    echo
    colour_blocks 0 {40..47}
    colour_blocks "" {100..107}
}

colour_blocks() {
    local padding=$1; shift

    for c in "$@"; do
        echo -ne "\e[${c}m    ${padding}${c}    ${reset} "
    done
    echo
}

git_diff() {
    echo -e "${dim}${cyan}diff --git a/foo.sh b/foo.sh"
    echo -e "index abcdef0..93f3a4d 100755"
    echo -e "--- a/foo.sh"
    echo -e "+++ b/foo.sh${reset}"
    echo -e "${dim}${magenta}@@ -42,2 +42,3 @@${reset} * Some list item"
    echo -e " * Some other list item"
    echo -e "${bold}${red}-## A${bgRed}n old ${bgReset}${red}title${reset}"
    echo -e "${bold}${green}+"
    echo -e "+##${bgGreen}#${bgReset} A${bgGreen} newly changed sub${bgReset}title${reset}"
}

messages() {
    echo
    echo -e "${dim}Dim line of text       ${cyan}Dim info message       ${yellow}Dim warning message       ${red}Dim error message${reset}"
    echo -e "Normal line of text    ${cyan}Normal info message    ${yellow}Normal warning message    ${red}Normal error message${reset}"
    echo -e "${bold}Bold line of text      ${cyan}Bold info message      ${yellow}Bold warning message      ${red}Bold error message${reset}"
}

zsh_prompt() {
    local bg dir text sep=''

    if [ "$1" = "green" ]; then
        bg=${bgBGreen}
        dir=${green}
        text=${grey}
        icons="${red}✘ ${grey}⬇ ${blue}✹ ${green}✚"
    else
        bg=${bgBlue}
        dir=${blue}
        text=${white}
        icons="${green}✔ ${grey}⬆ ${yellow}✭"
    fi

    echo
    echo -en "${bgWhite}${black} 16:20:42 ${bg}${white}${sep}${text} ~/dev/project ${bgWhite}${dir}${sep}"
    echo -e "${black}  master ${icons} ${bgReset}${white}${sep}${reset}"
    echo -e "${bold}${green}\$${reset} ${2}"
}

main
