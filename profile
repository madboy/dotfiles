alias l='ls -FGh'
alias ll='l -l'
alias la='l -a'
alias crontab='VIM_CRONTAB=true crontab'

export PATH=/usr/local/bin:${PATH}
export PATH=${PATH}:/usr/local/share/python # for pip executables
export WORKON_HOME=${HOME}/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/share/python/virtualenvwrapper_lazy.sh

export ANDROID_SDK=/Users/krl/Downloads/adt-bundle-mac-x86_64-20130522/sdk
export ANDROID_TOOLCHAIN=/Users/krl/Documents/android-ndk
export PATH=${PATH}:/Users/krl/Downloads/adt-bundle-mac-x86_64-20130522/sdk/platform-tools

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
