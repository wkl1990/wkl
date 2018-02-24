# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias l='ls'
alias ll='ls -lh'
alias vi="vim"
alias c.="cd ..;ls"
alias c..="cd ..;cd ..;ls"
alias c...="cd ..;cd ..;cd ..;ls"
alias c....="cd ..;cd ..;cd ..;cd ..;ls"
alias c.....="cd ..;cd ..;cd ..;cd ..;cd..;ls"
alias le="less -S"
alias cp="cp -i"
alias mv="mv -i"
alias work="cd /zs32/data-analysis/liucy_group/wkl/;ls -lh"

###env=~/.ssh/agent.env

###agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

###agent_start () {
###    (umask 077; ssh-agent >| "$env")
###    . "$env" >| /dev/null ; }

###agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
###agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

###if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
###    agent_start
###    ssh-add
###elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
###    ssh-add
###fi

###unset env

###ssh-add ~/.ssh/id_rsa2
