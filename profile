alias l='ls -FGh'
alias ll='l -l'
alias la='l -a'
alias crontab='VIM_CRONTAB=true crontab'

export PATH=/usr/local/bin:${PATH}
export PATH=${PATH}:/usr/local/share/python # for pip executables
export WORKON_HOME=${HOME}/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/share/python/virtualenvwrapper_lazy.sh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

if [ -f .work_profile ]; then
    source .work_profile
fi

export PS1='\h:\W \u\$ '
