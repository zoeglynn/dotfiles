case "$-" in 
*i*) echo "running .bashrc" ;
    source ~/.alias ;;
esac


function ps1_virtualenv_context {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo -n "(`basename "$VIRTUAL_ENV"`)"
    fi
}

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
	BLUE="\[\e[34m\]"
	GREEN="\[\e[32m\]"
	BOLDRED="\[\e[01;31m\]"
	BOLDBLUE="\[\e[01;34m\]"
	NOCOLOR="\[\e[0m\]"
	BLUEBG="\[\e[44m\]"
	export PS1="$BLUE\t $GREEN\u@\h $BLUE\w $BOLDRED\$([[ \$? != 0 ]] && echo \":( \")$NOCOLOR\$([[ -n \"\$VIRTUAL_ENV\" ]] && echo \"(\`basename \$VIRTUAL_ENV\`) \")$BOLDBLUE\$ $NOCOLOR"
	export SUDO_PS1="$BLUE\t $BLUEBG$GREEN\u@\h$NOCOLOR $BLUE\w $BOLDBLUE\$ $NOCOLOR"
else
	export PS1="\t \u@\h \w \$([[ \$? != 0 ]] && echo \":( \")\$([[ -n \"\$VIRTUAL_ENV\" ]] && echo \"(\`basename \$VIRTUAL_ENV\`) \")\$ "
fi

export PATH="~/bin:$PATH"
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
