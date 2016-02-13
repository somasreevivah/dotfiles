# Editing

if which vim; then 
  export EDITOR='vim'
else
  echo "\033[0;101mVIM IS NOT INSTALLED! OMG!\033[0m"
fi

export VISUAL="$EDITOR"
#alias q="$EDITOR"
#alias qv="q $DOTFILES/link/.{,g}vimrc +'cd $DOTFILES'"
#alias qs="q $DOTFILES"
