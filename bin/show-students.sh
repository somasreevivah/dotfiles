for user in $(ps aux | cut -d " " -f1 | sort ); do 
  if [[ $user != $last ]] ; then 
    if [[ $user = [st,ph]* ]]; then
      finger $user | grep "Name:"
    fi
  fi
  last=$user
done
