 #Editing

if which vim>/dev/null; then 
  export EDITOR='vim'
else
  echo "\033[0;101mVIM IS NOT INSTALLED! OMG!\033[0m"
fi

export VISUAL="$EDITOR"
