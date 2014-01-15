case "$-" in 
*i*) echo "running .bashrc" ;
    source ~/.alias ;;
esac


if [ -n "$EMACS" ]; then
    export PS1="\t \u@\h:\w \$ "
else
	export PS1="\[\033[34m\]\t [\u@\h:\W] $\[\033[0m\] "
fi
