# /etc/bash.bashrc
#
# by Alexiobash
# https://alexiobash.com
# me (at) alexiobash (dot) com

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
PS1='\[\e[31;1m\]\u\[\e[37;1m\]@\[\e[34;1m\]\h \[\e[0m\]\W \[\e[31;1m\]\$ \[\e[0m\]'
PS2='> '
PS3='> '
PS4='+ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

export EDITOR=vim
export HISTTIMEFORMAT="%d.%m.%Y %H:%M:%S "

alias ls='ls --color'
alias ll='ls -l'
alias grep='grep --color'

# force proxy by yaourt-gui
if [ -f /etc/profile.d/proxy.sh ]; then
        source /etc/profile.d/proxy.sh
else
        unset http_proxy
        unset https_proxy
        unset ftp_proxy
fi

# end file
