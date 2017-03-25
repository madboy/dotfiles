if [ -f .aliases ]; then
    source .aliases
fi

if [ -f .bashrc ]; then
    source .bashrc
fi

export PATH=/usr/local/bin:${PATH}
#export PATH=${PATH}:/usr/local/share/python # for pip executables
export PATH=${PATH}:${HOME}/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export WORKON_HOME=${HOME}/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

[[ -s .work_profile ]] && . .work_profile

export PS1='\h:\W \u\$ '

source ${HOME}/.git-completion.bash

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

[[ -s /usr/local/etc/bash_completion.d/go-completion.bash ]] && . /usr/local/etc/bash_completion.d/go-completion.bash


test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
