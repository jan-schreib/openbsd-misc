export AUTOCONF_VERSION=2.69
export AUTOMAKE_VERISON=1.9

alias ll='ls -alkF'
alias ls='ls -F'

[[ -x `whence vim 2>/dev/null` ]] && alias vi='vim'
[[ -x `whence pwgen 2>/dev/null` ]] && alias pwgen='pwgen -AnyB'

#set -o emacs
#alias __A='^P'
#alias __B='^N'

#alias __D='^B'
#alias __C='^F'
#alias __H='^A'
#alias __F='^E'
#alias __G='^O'
#set -o emacs

function _setprompt
{
 PROMPT="$(whoami)@$(uname -n):"$(echo $PWD | sed -e "s%$HOME%~%")'$ '
 export PS1="$PROMPT"
}

function _chdir
{
 \cd "$@"
 _setprompt
}

alias cd=_chdir
_setprompt

