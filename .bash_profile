# Adds git magic
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
exitstatus()
{
    if [[ $? == 0 ]]; then
        echo ':)'
    else
        echo ':('
    fi
}
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
# GRAYBACKG="\[\e[100m\]\]"
GREEN="\[\e[1;32m\]\]"
BLUE="\[\033[36m\]"
RED="\[\e[31m\]\]"
RESET="\[$(tput sgr0)\]"

#Shell Prompt
export PS1="${RED}[\d \t] ${BLUE}\u@\h ${RESET}\$(exitstatus) ${GREEN}\w${RESET} \n\[\033[33m\]\$(parse_git_branch) ${RESET}$ "
export PS2=">"

#Quality of Life
alias ls="ls -a"
alias s="ls"
alias l="ls"
alias cp="rsync -av --progress"
alias cp-remote-pc="rsync -avz -e 'ssh -p 60394'" #rsync -avz -e "ssh -p $portNumber" user@remote.host:/path/to/copy /local/path
alias cow="fortune | cowsay"
alias .="ls -a"
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias q="exit"
alias watch="sass --watch"
alias make-dev-env="cd ~/vagrant-lamp && ansible-playbook ansible/playbooks/vagrant/site/php.yml"
alias cvlc='/Applications/VLC.app/Contents/MacOS/VLC cvlc'
alias sequelize='node_modules/.bin/sequelize'

alias brew-update="brew update -v"

#ssh Shortcuts
alias server-remote="clear && ssh -vYX hookerhome@hookerhome.duckdns.org -p 60293"
alias server-lan="clear && ssh -vYX hookerhome@192.168.1.123 -p 60293"

alias pc-lan="clear && ssh celeborn@192.168.1.101 -p 60394"
alias pc-remote="clear && ssh celeborn@hookerhome.duckdns.org -p 60394"

#Git Aliases
alias init="git init"
alias clone="git clone"
alias status="git status"
alias add="git add ."
alias commit="git commit"
alias push="git push origin"
alias remote-add="git remote add origin"
alias checkout-new='git checkout -b'
alias checkout='git checkout'

#Unison commands
alias local-code-push="unison ~/code ssh://Hackintosh.local/code -servercmd /usr/local/bin/unison"
alias local-code-retrieve="unison ssh://Hackintosh.local/code ~/code -servercmd /usr/local/bin/unison"
alias remote-code-push="unison ~/code ssh://12.8.1.7/code -servercmd /usr/local/bin/unison"
alias remote-code-retrieve="unison ssh://12.8.1.7/code ~/code -servercmd /usr/local/bin/unison"
alias code-backup-local='unison ~/code ssh://hookerhome@192.168.1.123//Personal-Files/Doug/code-backup -servercmd "/usr/bin/unison" -sshargs "-p 60293"'
alias code-backup-remote='unison ~/code ssh://hookerhome@192.168.1.123//Personal-Files/Doug/code-backup -servercmd "/usr/bin/unison" -sshargs "-p 60293"'


##
# Your previous /Users/celeborn/.bash_profile file was backed up as /Users/celeborn/.bash_profile.macports-saved_2017-08-07_at_11:59:06
##

# MacPorts Installer addition on 2017-08-07_at_11:59:06: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


#Android stuff
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

