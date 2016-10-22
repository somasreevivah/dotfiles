
_lib ()   #  By convention, the function name
{                 #+ starts with an underscore.
  local cur
  # Pointer to current completion word.
  # By convention, it's named "cur" but this isn't strictly necessary.

  COMPREPLY=()   # Array variable storing the possible completions.
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  case "$cur" in
    -*)
      COMPREPLY=( $( compgen -W '-h -v -l' -- $cur ) );;
     *)
       COMPREPLY=( $(compgen -W "$(lib -l)" -- $cur))
  esac

  #case "$prev" in
    #-i)
      #COMPREPLY=($(ls --color=never ${HOME}/.lib))
      #;;
  #esac

  return 0
}

complete -F _lib lib
