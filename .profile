PATH=$PATH:$HOME/.rvm/bin:$HOME/src/vmware-git-tools/bin # Add RVM to PATH for scripting
PATH=$PATH:/build/apps/bin # Add build tools to the path

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
PS1='\[\e[0;32m\]\u:\[\e[m\]\[\e[0;36m\]\w\[\e[m\]\[\e[0;32m\]$(parse_git_branch)\[\e[m\]\[\e[1;32m\]\$\[\e[m\] '

### PERFORCE ALIASES
export P4CONFDIR="$HOME/.p4config"
alias p4login='p4 login < $P4CONFDIR/.pwd'
alias p4panda='. $P4CONFDIR/p4config-panda; p4login'
alias p4toolchain='. $P4CONFDIR/p4config-toolchain; p4login'
alias p4releng='. $P4CONFDIR/p4config-releng; p4login'
alias p4bora='. $P4CONFDIR/p4config-bora; p4login'
alias p4lotus='. $P4CONFDIR/p4config-lotus; p4login'
alias p4lotusr='. $P4CONFDIR/p4config-lotus-rhino; p4login'
alias p4vmkm='. $P4CONFDIR/p4config-vmkm; p4login'
alias p4vc='. $P4CONFDIR/p4config-vc; p4login'

alias sshroot='ssh -l root'

### PERFORCE SETTINGS
export P4EDITOR="mvim -f"
export P4DIFFER=opendiff
export P4CLIENT=thall-osx
export P4USER=thall

### DBC ALIASES
export DBCSERV="pa-dbc1121.eng.vmware.com"
alias dbcssh="ssh $DBCSERV"

### ESXi ALIASES
export ESXSERV="sea2-office-dhcp-96-170"
alias esxssh="ssh root@$ESXSERV"

### TOOLCHAIN
export TCROOT="/build/toolchain"

### Aliases
alias ovftool="/Applications/VMware\ OVF\ Tool/ovftool"
alias e="subl -n ."

### JAVA HOME
export JAVA_HOME=$(/usr/libexec/java_home)

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

### DIRENV HOOK
eval "$(direnv hook bash)"
