
if [[ $TERM = "linux" || $TERM = "screen" ]]; then
  which lynx &> /dev/null && export BROWSER="lynx"
else
  if dfs::is_osx ; then
    export BROWSER="open -a Safari"
  else
    export BROWSER="firefox"
  fi
fi

