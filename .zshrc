autoload -U +X bashcompinit && bashcompinit
autoload -Uz +X compinit && compinit

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
export PATH=$PATH:opt/homebrew/share/google-cloud-sdk/bin # gcloud

## nvim aliases
alias vi=nvim
alias vim=nvim

## GPG Setup
export GPG_TTY=$(tty)

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
export PATH=$PATH:$GOPATH/bin

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


## Rustup
source "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export AWS_PROFILE="travis-sandbox"
