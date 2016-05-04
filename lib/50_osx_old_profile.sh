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
chtouch(){
  path=$1;
  touch $1;
  chmod 0777 $1;
}

alias phyconnect="ssh st119286@ssh.physcip.uni-stuttgart.de";
alias sandraphyconnect="ssh phy51397@ssh.physcip.uni-stuttgart.de";
alias physync="$HOME/Documents/compilationes/Programs/shell/physync.sh"


# FOR ANDROID SDK
PATH="${PATH}:/Development/android-sdk-macosx/platform-tools:/Development/android-sdk-macosx/tools"
export PATH
ANDROID_HOME="/Development/android-sdk-macosx/platform-tools:/Development/android-sdk-macosx"
export ANDROID_HOME



PATH="~/bin:${PATH}"
export PATH
PATH="~/Library/Python/2.7/bin:${PATH}"
export PATH


############
#  LOCALE  #
############

export PATH=/Users/alejandrogallo/Library/Python/2.7/bin:$PATH
