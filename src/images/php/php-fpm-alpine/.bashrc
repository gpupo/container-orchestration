if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

export PS1='\h\[\033[36m\]@\[\033[0m\]\[\033[0;32m\]${COMPOSE_PROJECT_NAME:-container}:\[\033[36m\]\w\[\033[0m\] \$ ';
