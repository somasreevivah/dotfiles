SDCV_FLAGS=' -v --version \
-l --list-dicts \
-u --use-dict=bookname \
-n --non-interactive \
-0 --utf8-output \
-1 --utf8-input \
-2 --data-dir=path/to/dir \
-c --color '

_sdcv ()   #  By convention, the function name
{                 #+ starts with an underscore.
  local cur
  # Pointer to current completion word.
  # By convention, it's named "cur" but this isn't strictly necessary.

  COMPREPLY=()   # Array variable storing the possible completions.
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  case "$cur" in
    -*)
      COMPREPLY=(
        $( compgen -W "${SDCV_FLAGS}" -- $cur )
      )
      ;;
    *)
      COMPREPLY=() ;;
  esac

  case "$prev" in
    -u)
      COMPREPLY=($(compgen -W "$(_get_libs)" -- $cur))
      ;;
  esac

  return 0
}

_get_libs(){
  list=()
  sdcv -l              |
  sed 1d |
  rev                  |
  cut -d ' ' -f2-      |
  rev
}

complete -F _sdcv sdcv
