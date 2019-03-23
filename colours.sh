#!/usr/bin/env bash

main() {
    colourscheme
    colours
    messages
    weechat
    zsh_prompt blue
    zsh_prompt green "git --no-pager diff"
    git_diff
}

dim=$(tput dim)
bold=$(tput bold)

black=$'\e[30m'
grey=$'\e[38;5;236m'
white=$'\e[37m'
default=$'\e[39m'
red=$'\e[31m'
green=$'\e[32m'
blue=$'\e[34m'
cyan=$'\e[36m'
yellow=$'\e[33m'
magenta=$'\e[35m'
Byellow=$'\e[93m'
Bmagenta=$'\e[95m'
reset=$'\e[0m'

bgWhite='\e[48;5;7m'
bgRed='\e[48;5;52m'
bgGreen='\e[48;5;22m'
bgBGreen='\e[48;5;2m'
bgBlue='\e[48;5;4m'
bgMagenta='\e[45m'
bgReset='\e[49m'

pad() {
    str=${2:- }
    yes "$str" | head -n "$1" | tr -d '\n'
}

colourscheme() {
    local border

    if [ "$TERM" = "alacritty" ]; then
        border=$(pad 95 '#')

        echo -en "${white}${border}\n Current Colour Scheme: "
        grep -oP '# Colors \(\K[^\)]+' ~/.config/alacritty/alacritty.yml
        echo "$border${reset}"
    fi
}

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

weechat() {
    local stats

    echo
    echo -e "$(wc_buf weechat 1. open)${bgBlue}${default}Highlight Monitor$(pad 55)${bgReset}"
    echo -e "$(wc_buf freenode)$(wc_timestamp 16 20 42) $(wc_clabel 'freenode#archlinux') $(wc_nlabel hunter1) $(whoami): ping!"

    stats="$(wc_stat ping 3 '#archlinux' 1 42), $(wc_stat pm 5 hunter1 7), $(wc_stat new 4 512 538)"
    echo -en "$(wc_buf highmon 2.)${bgBlue}$(wc_label '17:12') $(wc_label 4)"
    echo -e " ${yellow}2${cyan}:${default}highmon $(wc_label "H: ${stats}") "

    echo -e "$(wc_buf '#archlinux' 3. ping)$(wc_label INSERT) [$(whoami)$(wc_label Ri '(')] ${default}▯"
    echo -e "$(wc_buf '#sway' 4. new)$(pad 72 -)"
    echo -e "$(wc_buf hunter1 5. pm)"
}

wc_buf() {
    local pre colour num dif space

    if [ "$3" = "ping" ]; then colour=$magenta
    elif [ "$3" = "new" ]; then colour=$yellow
    elif [ "$3" = "pm" ]; then colour=$green
    else colour="${default}"; fi

    [ -n "$3" ] && [ ! "$3" = "open" ] && space="  " || space=""
    [ "$3" = "open" ] && pre=$bgBlue || pre=$reset
    num=${2:-  }${space}
    dif=$(( 21-(${#num}+${#1}) ))

    echo -e "${pre} ${green}${num}${colour}${1}$(pad $dif)${bgReset}${blue}│"
}

wc_clabel() {
    wc_label "$1" '<' magenta green
}

wc_nlabel() {
    wc_label "$1" '<' Byellow default bgMagenta
}

wc_stat() {
    local colour colour2=default id="$2" label value

    case "$1" in
        "ping")
            label=$3; colour=magenta; colour2=yellow; shift 3 ;;
        "pm")
            label=$3; colour=green; shift 3 ;;
        "new")
            colour=yellow; shift 2 ;;
    esac

    value="$1";
    [ $# -eq 2 ] && value+="${cyan},${!colour2}${2}"
    [ -n "$label" ] && label="${cyan}:${default}${label}"

    echo -e "${!colour}${id}${label}$(wc_label "${value}" '(' $colour)"
}

wc_label() {
    local tag_o=${2:-[} tag_c=]
    local c_tag=${!4:-$cyan} c_lbl=${!3:-$default}

    [ "$tag_o" = "<" ] && tag_c=">"
    [ "$tag_o" = "(" ] && tag_c=")"
    [ -n "$5" ] && local res=${reset}

    echo -e "${c_tag}${tag_o}${!5}${c_lbl}${1}${res}${c_tag}${tag_c}"
}

wc_timestamp() {
    echo -e "${default}${1}${yellow}:${default}${2}${yellow}:${default}${3}"
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
