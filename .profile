export SHELL=/usr/local/bin/bash

PATH=$PATH:$HOME/.rvm/bin:$HOME/src/vmware-git-tools/bin # Add RVM to PATH for scripting
PATH=$PATH:/build/apps/bin # Add build tools to the path
PATH=/usr/local/bin:$PATH
PATH="/usr/local/opt/curl/bin:$PATH"
PATH=$PATH:$HOME/workspace/vane/bin
PATH=$PATH:/usr/local/kubebuilder/bin

## Git Branch Display
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

## Title terminal
function title() {
  echo -ne "\033]0;"$*"\007"
}

### COLORS
export CLICOLOR='true'
PS1='\[\e[0;32m\]\u:\[\e[m\]\[\e[0;36m\]\w\[\e[m\]\[\e[0;32m\]$(parse_git_branch)\[\e[m\]\[\e[0;32m\]\$\[\e[m\] '

### DBC ALIASES
export DBCUSER="thall"
export DBCHOST="sc-dbc1220"
export DBCSERV="$DBCHOST.eng.vmware.com"
alias dbcssh="ssh $DBCSERV"

### NIMBUS SSHUTTLE
nimbusshuttle() {
  sshuttle -r kubo@$1 30.0.0.0/16 40.0.0.0/16 192.168.111.0/24 192.168.150.0/24 -e 'ssh -o StrictHostKeyChecking=no'
}

### ESXi ALIASES
export ESXSERV="sea2-office-dhcp-96-170"
alias esxssh="ssh root@$ESXSERV"

### TOOLCHAIN
export TCROOT="/build/toolchain"

### Aliases
alias ovftool="/Applications/VMware\ OVF\ Tool/ovftool"
alias e="subl -n ."

### JAVA HOME
#export JAVA_HOME=$(/usr/libexec/java_home)

### GO PATH
export GOPATH=$HOME/workspace/go
PATH=$PATH:$GOPATH/bin

### GIT DUET
export GIT_DUET_ROTATE_AUTHOR=1

### SSH AUTOCOMPLETE
_complete_ssh_hosts ()
{
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  comp_ssh_hosts=`cat ~/.ssh/config | \
    grep "^Host " | \
    awk '{print $2}'`
  COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur) )
  return 0
}
complete -F _complete_ssh_hosts ssh
complete -F _complete_ssh_hosts sshuttle
complete -F _complete_ssh_hosts scp

### DIRENV HOOK
eval "$(direnv hook bash)"

### KUBO ENVS
export LOCKS=$HOME/workspace/envs
export MY_KUBO=$HOME/workspaces/envs/thall

### KUBO HOME
PATH=$PATH:$HOME/workspace/kubo-home/bin

### PAGE ZIPPED FILES
alias less=zless

### LOAD AUTOCOMPLETIONS
if [ -d /usr/local/etc/bash_completion.d ]; then
    for F in "/usr/local/etc/bash_completion.d/"*; do
        if [ -f "${F}" ]; then
            source "${F}";
        fi
    done
fi

### GIMME
source $HOME/.gimme/envs/latest.env 2&> /dev/null
