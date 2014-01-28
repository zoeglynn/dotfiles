case "$-" in 
*i*) echo "running .profile" ;;
esac

export PATH=~/working/scripts/python/:~/working/scripts/bash/:${PATH}
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:${PATH}
export MAGICK_HOME=/Applications/ImageMagick-6.3.4
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib"


# export PS1="\t \e[0;31m\u@\h\e[m:\e[0;34m\w\e[m \e[1m\$\e[m "
export PS1="\t \u@\h:\w \$ "

if [ -z "$EMACS" ]; then
    source ~/.alias
fi

# for reference:
COLORS='[\u@TEST \w]\n \#\$ \n\
\[\
\e[1mBold Text\e[m\n\
\e[4mUnderline Text\e[m\n\
\e[5mBlink Text\e[m\n\
\e[7mInverse Text\e[m\]\n\
Should be normal text
Foreground colors:
\[\
\e[0;30m30: Black\n\
\e[0;31m31: Red\n\
\e[0;32m32: Green\n\
\e[0;33m33: Yellow\Orange\n\
\e[0;34m34: Blue\n\
\e[0;35m35: Magenta\n\
\e[0;36m36: Cyan\n\
\e[0;37m37: Light Gray\Black\n\
\e[0;39m39: Default\n\
Bright foreground colors:
\e[1;30m30: Dark Gray\n\
\e[1;31m31: Red\n\
\e[1;32m32: Green\n\
\e[1;33m33: Yellow\n\
\e[1;34m34: Blue\n\
\e[1;35m35: Magenta\n\
\e[1;36m36: Cyan\n\
\e[1;37m37: White\n\
\e[0;39m39: Default\n\
\e[m\]Background colors:
\[\e[1;37m\e[40m40: Black\e[0;49m\n\
\e[41m41: Red\e[0;49m\n\
\e[42m42: Green\e[0;49m\n\
\e[43m43: Yellow\Orange\e[0;49m\n\
\e[44m44: Blue\e[0;49m\n\
\e[45m45: Magenta\e[0;49m\n\
\e[46m46: Cyan\e[0;49m\n\
\e[47m47: Light Gray\Black\e[0;49m\n\
\e[49m49: Default\e[m\]\n'


##
# Your previous /Users/zoe/.profile file was backed up as /Users/zoe/.profile.macports-saved_2011-01-09_at_13:27:01
##

# MacPorts Installer addition on 2011-01-09_at_13:27:01: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -s ~/.bashrc ]; then
	source ~/.bashrc
fi

if [ -s ~/.bash_login ]; then
	echo 'sourcing .bash_login'
	source ~/.bash_login
fi
