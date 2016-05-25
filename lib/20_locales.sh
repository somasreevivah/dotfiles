
return

#This variable governs the collation rules used for sorting and regular
#expressions.  Setting the value to C can for example make the ls command sort
#dotfiles first, followed by uppercase and lowercase filenames: 
#export LC_COLLATE="C"



if [[ -f /etc/default/locale ]]; then
  cat /etc/default/locale | while read locale_line ; do eval "export $locale_line"; done
else
  export LANG=en_US.UTF-8
  for LOC in $(locale -a) ; do
    if [[ $LOC =~ "UTF-8" ]]; then
      LC_ALL=$LOC
      return 0
    fi
  done
  export LC_ALL=C
fi



#LC_ALL is the only LC_* variable, which cannot be set in locale.conf files: it
#is meant to be used only for testing or troubleshooting purposes, for example
#in /etc/profile
#LC_ALL
