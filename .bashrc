# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias python3='python3.6'
alias yass='yes'

# LS_COLORS schema
alias ls='ls --color'
LS_COLORS=$LS_COLORS:'di=34:ex=32'
export LS_COLORS

# fancy colored prompt
export C_NC='\e[0m' # No Color
export C_WHITE='\e[1;37m'
export C_BLACK='\e[0;30m'
export C_BLUE='\e[0;34m'
export C_LIGHT_BLUE='\e[1;34m'
export C_GREEN='\e[0;32m'
export C_LIGHT_GREEN='\e[1;32m'
export C_CYAN='\e[0;36m'
export C_LIGHT_CYAN='\e[1;36m'
export C_RED='\e[0;31m'
export C_LIGHT_RED='\e[1;31m'
export C_PURPLE='\e[0;35m'
export C_LIGHT_PURPLE='\e[1;35m'
export C_BROWN='\e[0;33m'
export C_YELLOW='\e[1;33m'
export C_GRAY='\e[1;30m'
export C_LIGHT_GRAY='\e[0;37m'

# deconstruct the working directory
path () {
    if [ $(pwd) == "/" ]; then
        :
    elif [ $(pwd) == ${HOME} ]; then
        :
    elif [ $(dirname $(pwd)) == "/" ]; then
        echo -n "/"
    elif [[ $(pwd) == ${HOME}/* ]]; then
        HOMELEN=${#HOME}
        HOMECPY="`dirname $(pwd)`"
        MIDDLE=${HOMECPY:$HOMELEN}
        if [[ -z ${MIDDLE} ]]; then
            MIDDLE="/"
        else
            MIDDLE="${MIDDLE}/"
        fi
        echo "~${MIDDLE}"
    else
        PREFIX="`dirname $(pwd)`/"
        echo -e $PREFIX
    fi
}

# show command success or failure
# syntax error with escape sequences: see
# https://superuser.com/questions/301353/escape-non-printing-characters-in-a-function-for-a-bash-prompt
# for details
exitcode() {
    if [ $? == 0 ]; then
        echo -e "\x01${C_GREEN}\x02:) "
    else
        echo -e "\x01${C_RED}\x02:( "
    fi
}

# purple + green + teal color scheme
# PS1="\$(exitcode)\[${C_LIGHT_PURPLE}\]\u\[${C_GRAY}\]@\[${C_LIGHT_GREEN}\]\h: \[${C_GRAY}\]\$(path)\[${C_LIGHT_CYAN}\]\W \[${C_GRAY}\]\$\[${C_NC}\] "

# blue + gold color scheme
# PS1="\$(exitcode)\[${C_YELLOW}\]\u\[${C_BLUE}\]@\[${C_BROWN}\]\h: \[${C_BLUE}\]\$(path)\[${C_LIGHT_BLUE}\]\W \[${C_BROWN}\]\$\[${C_NC}\] "

# "jewel" color scheme
PS1="\$(exitcode)\[${C_LIGHT_GREEN}\]\u\[${C_PURPLE}\]@\[${C_GREEN}\]\h: \[${C_CYAN}\]\$(path)\[${C_LIGHT_RED}\]\W \[${C_PURPLE}\]\$\[${C_NC}\] "

export GOPATH="$HOME/code/go"
export GOBIN="$GOPATH/bin"
export PATH=$GOBIN:$PATH
