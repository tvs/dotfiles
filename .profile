export SHELL=/usr/local/bin/bash

# Required for load-k8s-master
PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/build/apps/bin # Add build tools to the path
PATH=/usr/local/bin:$PATH
PATH="/usr/local/opt/curl/bin:$PATH"
PATH=$PATH:/usr/local/kubebuilder/bin
PATH=$PATH:$HOME/src/tools/bin

## nvim aliases
alias vi=nvim
alias vim=nvim

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
export DBCHOST="sc-dbc2162"
export DBCSERV="$DBCHOST.eng.vmware.com"
alias dbcssh="ssh $DBCSERV"

### NIMBUS SSHUTTLE
nimbusshuttle() {
  sshuttle -r kubo@$1 30.0.0.0/16 40.0.0.0/16 192.168.111.0/24 192.168.150.0/24 -e 'ssh -o StrictHostKeyChecking=no'
}

### Aliases
alias ovftool="/Applications/VMware\ OVF\ Tool/ovftool"
alias e="subl -n ."

### GO PATH
export GOPATH=$HOME/workspace/go
PATH=$PATH:$GOPATH/bin

### Generate a Golang pseduo version
alias gopseudo='TZ=UTC git --no-pager show --quiet --abbrev=12 --date='format-local:v0.0.0-%Y%m%d%H%M%S' --format="%cd-%h"'

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

### PAGE ZIPPED FILES
alias less=zless

### LOAD AUTOCOMPLETIONS
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  source /usr/local/share/bash-completion/bash_completion
fi

if [ -d /usr/local/etc/bash_completion.d ]; then
    for F in "/usr/local/etc/bash_completion.d/"*; do
        if [ -f "${F}" ]; then
            source "${F}";
        fi
    done
fi

# GO Settings
export GOPRIVATE=gitlab.eng.vmware.com

### COLIMA/DOCKER HOST
export DOCKER_HOST="unix:///Users/thall/.colima/default/docker.sock"

### Get Supervisor Control Plane credentials
getsupervisorcreds() {
  ssh-keygen -R "$1"
  ssh-keyscan "$1" >> ~/.ssh/known_hosts
  sshpass -p "$2" ssh -o IdentitiesOnly=yes -F /dev/null root@$1 '/usr/lib/vmware-wcp/decryptK8Pwd.py'
}
