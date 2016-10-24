
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
      COMPREPLY=( $( compgen -W '-h -v -l -d' -- $cur ) );;
    *)
      COMPREPLY=( $(compgen -W "$(lib -l)" -- $cur)) ;;
  esac

  case "$prev" in
    -d)
      COMPREPLY=($(compgen -W "$(_complete_lib_variables $cur)" -- $cur))
      ;;
  esac

  return 0
}

_complete_lib_variables() {
  local cur=$1
  local modes=($(lib -l))
  local keywords=(
  _PATH
  _PICKER
  _SEARCHER
  _ACTION
  )
  local varName
  local functionName
  for mode in ${modes[@]} ; do
    for keyword in ${keywords[@]} ; do
      varName="${mode}${keyword}="
      functionName=${cur%${varName}}
      if [[ ! ${cur} == ${varName}* ]]; then
        echo ${varName}
      else
        echo ${varName}_hello
        echo ${varName}_world
      fi
    done
  done
}

complete -F _lib lib
