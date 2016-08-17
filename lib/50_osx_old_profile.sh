# OSX-only stuff. Abort if not OSX.
dfs_is_osx || return 1


expenses(){
  cd  ~/Documents/compilationes/programs/python/expenses/;
  python2.7 -i expenses.py;
  cd $OLDPWD;
}
insertexpenses(){
  cd  ~/Documents/compilationes/programs/python/expenses/;
  python2.7 insert_script.py;
  cd $OLDPWD;
}

alias phyconnect="ssh st119286@ssh.physcip.uni-stuttgart.de";
alias sandraphyconnect="ssh phy51397@ssh.physcip.uni-stuttgart.de";
alias physync="$HOME/Documents/compilationes/Programs/shell/physync.sh"
