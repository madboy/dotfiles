if [ -f .aliases ]; then
    source .aliases
fi

export PATH=/usr/local/bin:${PATH}
export PATH=${PATH}:/usr/local/share/python # for pip executables
export PATH=${PATH}:${HOME}/bin
export WORKON_HOME=${HOME}/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

if [ -f .work_profile ]; then
    source .work_profile
fi

export PS1='\h:\W \u\$ '
