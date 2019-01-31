#!/bin/sh

PS1="\[\e[90m\]\h:\u:\$PWD\\$ \[\e[m\]" && export PS1
LANG=C && export LANG

[ -d "$HOME/bin" ] && export PATH=$HOME/bin:$PATH
[ -d "$HOME/.local/bin" ] && export PATH=$HOME/.local/bin:$PATH

JAVA_HOME=`ls -d /app/jdk180 /jdk180 2>/dev/null |tail -1` && [ -n "$JAVA_HOME" ] && export PATH=$JAVA_HOME/bin:$PATH
export KAFKA_HOME=/kafka 
export PATH="${KAFKA_HOME}/bin:${PATH}"

T=LOGO which figlet >/dev/null && figlet `hostname` && echo ''

alias ll='ls -rtl' && alias llh='ls -alh'
alias lsport='sudo netstat -ntlp'
alias govms='cd /vms 2>/dev/null ||cd /*/vms 2>/dev/null '
alias godom="cd /kafka 2>/dev/null ||cd `pwd` 2>/dev/null "
alias doenv=' . ./setEnv.sh 2>/dev/null || . /vms/setEnv.sh 2>/dev/null ' 
#alias ps='ps -e -o user,pid,ppid,pcpu,vsz,rss,bsdstart,bsdtime,cmd '

alias psef='ps -ef|grep java|grep kafka|grep -v grep ; echo "" ; jps ; echo "" '
alias find='sudo \find -L '
alias tailf='ls -rt1 logs/*/*out 2>/dev/null;echo "--------";ls -rt1 logs/*/*out 2>/dev/null|tail -1|xargs tail -f '
alias tailfa='tail -F logs/*/*out'
alias runsh='docker exec -it node50 bash '
alias run='docker exec -it node50 '

