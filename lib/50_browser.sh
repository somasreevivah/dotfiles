dfs_log sourcing 50_browser.sh

if [[ $TERM = "linux" || $TERM = "screen" ]]; then
  if which elinks &> /dev/null; then
    export BROWSER="elinks" #I prefer elinks, it is nice 
  elif which lynx &> /dev/null; then
    export BROWSER="lynx"
    export LYNX_CFG=$HOME/.lynx.cfg
  fi
else
  if dfs_is_osx ; then
    export BROWSER="open -a Safari"
  else
    export BROWSER="qutebrowser"
  fi
fi

