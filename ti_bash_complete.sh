
## To use copy this file into /etc/bash_completion.d/
## and run . /etc/bash_completion.d/ti_bash_complete.sh
## or whatever makes sense on your system.

_ti()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(ti list)

    if [[ "on o" =~ ${prev} ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
}
complete -F _ti ti
