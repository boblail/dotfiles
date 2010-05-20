# if [[ -s /Users/bob/.rvm/scripts/rvm ]] ; then source /Users/bob/.rvm/scripts/rvm ; fi
# test -r /sw/bin/init.sh && . /sw/bin/init.sh

##
# Your previous /Users/bob/.bash_profile file was backed up as /Users/bob/.bash_profile.macports-saved_2010-02-25_at_07:18:53
##

# Mysql
export PATH=/usr/local/mysql/bin:$PATH
alias ms=mysql

# MacPorts Installer addition on 2010-02-25_at_07:18:53: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export EDITOR=/usr/local/bin/mate -w

if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi