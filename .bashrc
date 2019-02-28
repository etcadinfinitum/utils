# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias vim='vimx'

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias python3='python3.6'

# fancy colored prompt
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_GRAY='\e[1;30m'
export COLOR_NC='\e[0m'
export COLOR_TEAL='\e[36m'
export COLOR_GREEN='\e[32m'
export COLOR_RED='\e[31m'

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

exitcode() {
    if [ $? == 0 ]; then
        echo -e "${COLOR_GREEN}:) "
    else
        echo -e "${COLOR_RED}:( "
    fi
}

PS1="\$(exitcode)\[${COLOR_LIGHT_PURPLE}\]\u\[${COLOR_GRAY}\]@\[${COLOR_LIGHT_GREEN}\]\h: \[${COLOR_GRAY}\]\$(path)\[${COLOR_TEAL}\]\W \[${COLOR_GRAY}\]\$\[${COLOR_NC}\] "
