autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/build/apps/bin # Add build tools to the path
PATH=/usr/local/bin:$PATH
PATH="/usr/local/opt/curl/bin:$PATH"
PATH=$PATH:/usr/local/kubebuilder/bin
PATH=$PATH:$HOME/src/tools/bin
eval "$(/opt/homebrew/bin/brew shellenv)"

## nvim aliases
alias vi=nvim
alias vim=nvim

## Git Branch Display
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

### COLORS
setopt PROMPT_SUBST
export CLICOLOR='true'
PS1=$'%F{green}%n:%F{cyan}%d%F{green}$(parse_git_branch)%F{yellow}%(!.#.$)%F{white} '

### GO PATH
export GOPATH=$HOME/go
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

export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
