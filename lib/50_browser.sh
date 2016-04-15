
if [[ $TERM = "linux" ]]; then
  which lynx &> /dev/null && export BROWSER="lynx"
else
  dfs::is_osx && export BROWSER="open -a Safari"
fi

