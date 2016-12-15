
  #This file is to source local configuration files,
  #in our case it is just for the bash configuration file.

LOCAL_CONFIGURATION_FILES=(
$HOME/.bashrc_local
$HOME/.bashrc.local
)


for file in ${LOCAL_CONFIGURATION_FILES[@]}; do
  [ -f $file ] && source $file
done
